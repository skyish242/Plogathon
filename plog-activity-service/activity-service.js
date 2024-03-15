// Import the necessary modules
import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import { Activity } from "./dbClient.js";

// Define path to .proto file
const PROTO_PATH = "proto/activity.proto";

// Load the .proto file
const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

// Obtain the package
const activityProto = grpc.loadPackageDefinition(packageDefinition);

// Implement your gRPC service
const server = new grpc.Server();

function timestampToDate(timestamp) {
  const milliseconds = timestamp.seconds * 1000 + timestamp.nanos / 1000000;
  return new Date(milliseconds);
}

function dateToTimestamp(date) {
  const milliseconds = date.getTime();
  const seconds = Math.floor(milliseconds / 1000);
  const nanos = (milliseconds % 1000) * 1000000;

  return {
    seconds: seconds,
    nanos: nanos,
  };
}

server.addService(activityProto.activity.ActivityService.service, {
  CreateActivity: async (call, callback) => {
    try {
      let newActivity = call.request;

      /**
       * Response format
       * Activity {
          dataValues: {
            ActivityID: 1,
            UserID: 1,
            Name: 'run',
            Type: 'run',
            Description: 'run',
            Datetime: 2024-03-12T15:42:33.076Z,
            RouteMap: 'wtf is this',
            Distance: 2034,
            Steps: 5000,
            WasteCount: 20
            Duration: 1000
          },
          _previousDataValues: {
            ActivityID: 1,
            UserID: 1,
            Name: 'run',
            Type: 'run',
            Description: 'run',
            Datetime: 2024-03-12T15:42:33.076Z,
            RouteMap: 'wtf is this',
            Distance: 2034,
            Steps: 5000,
            WasteCount: 20
            Duration: 1000
          },
          uniqno: 1,
          _changed: Set(0) {},
          _options: {
            isNewRecord: true,
            _schema: null,
            _schemaDelimiter: '',
            attributes: undefined,
            include: undefined,
            raw: undefined,
            silent: undefined
          },
          isNewRecord: false,
          null: 1
        }
      */

      const activityResponse = await Activity.create({
        ...newActivity,
        // Datetime: timestampToDate(newActivity.Datetime),
      });

      const responseValues = activityResponse.dataValues;

      callback(null, {
        ...responseValues,
        // Datetime: dateToTimestamp(responseValues.Datetime),
      });
    } catch (error) {
      console.error("Error creating activity:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  FindAllActivities: async (call, callback) => {
    try {
      const response = await Activity.findAll();
      callback(null, { activities: response });
    } catch (error) {
      console.error("Error finding all activities:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }

  },
  FindOneActivity: async (call, callback) => {
    try {
      const getResponse = await Activity.findOne({
        where: { ActivityID: call.request.ActivityID },
      });
      if (getResponse.dataValues) {
        callback(null, getResponse.dataValues);
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: "Activity not found",
        });
      }
    }
    catch (error) {
      console.error("Error finding one activity:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  UpdateActivity: async (call, callback) => {
    try {
      const activity = call.request;

      // Remove empty keys
      Object.keys(activity).forEach((key) => {
        if (
          activity[key] === "" ||
          activity[key] === null ||
          activity[key] === 0
        ) {
          delete activity[key];
        } else if (
          activity[key] &&
          typeof activity[key] === "object" &&
          "seconds" in activity[key] &&
          "nanos" in activity[key]
        ) {
          activity[key] = timestampToDate(activity[key]);
        }
      });

      await Activity.update(activity, {
        where: { ActivityID: activity.ActivityID },
      });

      const updateResponse = await Activity.findOne({
        where: { ActivityID: activity.ActivityID },
      });

      callback(null, updateResponse.dataValues);
    } catch (error) {
      console.error("Error updating activity:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  DeleteActivity: async (call, callback) => {
    try {
      const activityID = call.request.ActivityID;
      await Activity.destroy({ where: { ActivityID: activityID } });
      callback(null, null);
    } catch (error) {
      console.error("Error deleting activity:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
});

// Start server
server.bindAsync(
  "127.0.0.1:5001",
  grpc.ServerCredentials.createInsecure(),
  () => {
    console.log("Server running at http://127.0.0.1:5001");
  }
);
