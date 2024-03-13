// Import the necessary modules
import * as grpc from "@grpc/grpc-js";
import * as protoLoader from "@grpc/proto-loader";
import { User } from "./dbClient.js";

// Define path to .proto file
const PROTO_PATH = "proto/user.proto";

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
  },
  // Find all users
  FindAllUsers: async (call, callback) => {
    const getResponse = await User.findAll();
    callback(null, { users: getResponse });
  },
  // Find one user by ID
  FindOneUser: async (call, callback) => {
    const getResponse = await User.findOne({
      where: { UserID: call.request.UserID },
    });
    callback(null, getResponse);
  },
  // Update user
  UpdateUser: async (call, callback) => {
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
  },
  // Delete user by ID
  DeleteUser: async (call, callback) => {
    const userID = call.request.UserID;
    await User.destroy({ where: { UserID: userID } });
    callback(null, null);
  },
  // Login user
  LoginUser: async (call, callback) => {
    const user = call.request;
    const loginResponse = await User.findOne({
      where: { Username: user.Username, Password: user.Password },
    });
    callback(null, loginResponse);
  },
});

// Start server
server.bindAsync(
  "127.0.0.1:5002",
  grpc.ServerCredentials.createInsecure(),
  () => {
    console.log("Server running at http://127.0.0.1:5002");
  }
);
