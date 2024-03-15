// Import the necessary modules
import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import { User } from "./dbClient.js";

// Define path to .proto file
const PROTO_PATH = "proto/user.proto";

const SERVER_IP = "0.0.0.0";

// Load the .proto file
const packageDefinition = protoLoader.loadSync(PROTO_PATH, {
  keepCase: true,
  longs: String,
  enums: String,
  defaults: true,
  oneofs: true,
});

// Obtain the package
const userProto = grpc.loadPackageDefinition(packageDefinition);

// Implement your gRPC service
const server = new grpc.Server();

server.addService(userProto.user.UserService.service, {
  // Create User
  CreateUser: async (call, callback) => {
    try {
      let newUser = call.request;

      /**
       * Response Format
       * User {
          dataValues: {
              UserID: 1,
              Username: 'TestUsername',
              FirstName: 'TestFirstName',
              LastName: 'TestLastName',
              Email: 'TestEmail',
              StravaEmail: 'TestStravaEmail',
              Password: 'TestPassword'
          },
          _previousDataValues: {
              UserID: 1,
              Username: 'TestUsername',
              FirstName: 'TestFirstName',
              LastName: 'TestLastName',
              Email: 'TestEmail',
              StravaEmail: 'TestStravaEmail',
              Password: 'TestPassword'
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
      const createResponse = await User.create(newUser);

      callback(null, createResponse.dataValues);
    } catch (error) {
      console.error("Error creating user:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  // Find all users
  FindAllUsers: async (call, callback) => {
    try {
      const getResponse = await User.findAll();
      callback(null, { users: getResponse });
    } catch (error) {
      console.error("Error finding all users:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  // Find one user by ID
  FindOneUser: async (call, callback) => {
    try {
      const getResponse = await User.findOne({
        where: { UserID: call.request.UserID },
      });
      if (getResponse) {
        callback(null, getResponse);
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: "User not found",
        });
      }
    } catch (error) {
      console.error("Error finding one user:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  // Update user
  UpdateUser: async (call, callback) => {
    try {
      const user = call.request;

      // Remove empty keys
      Object.keys(user).forEach((key) => {
        if (user[key] === "") {
          delete user[key];
        }
      });
      await User.update(user, {
        where: { UserID: user.UserID },
      });
      const updateResponse = await User.findOne({
        where: { UserID: user.UserID },
      });
      callback(null, updateResponse);
    } catch (error) {
      console.error("Error updating user:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  // Delete user by ID
  DeleteUser: async (call, callback) => {
    try {
      const userID = call.request.UserID;
      await User.destroy({ where: { UserID: userID } });
      callback(null, null);
    } catch (error) {
      console.error("Error deleting user:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
  // Login user
  Login: async (call, callback) => {
    const user = call.request;
    try {
      const loginResponse = await User.findOne({
        where: { Username: user.Username, Password: user.Password },
      });
      if (loginResponse) {
        callback(null, loginResponse.dataValues);
      } else {
        callback({
          code: grpc.status.NOT_FOUND,
          details: "User not found or invalid credentials",
        });
      }
    } catch (error) {
      console.error("Error during login:", error);
      callback({
        code: grpc.status.INTERNAL,
        details: "Internal server error",
      });
    }
  },
});

// Start server
server.bindAsync(
  `${SERVER_IP}:5002`,
  grpc.ServerCredentials.createInsecure(),
  () => {
    console.log(`Server running at http://${SERVER_IP}:5002`);
  }
);
