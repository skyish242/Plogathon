import { Sequelize, DataTypes } from "sequelize";

export const sequelize = new Sequelize(
  process.env.DATABASE,
  process.env.DATABASE_USER,
  process.env.DATABASE_PASSWORD,
  {
    host: process.env.DATABASE_HOST,
    port: parseInt(process.env.DATABASE_PORT, 10),
    dialect: process.env.DATABASE_DIALECT,
  }
);

export const Activity = sequelize.define(
  "Activity",
  {
    ActivityID: {
      type: DataTypes.INTEGER,
      primaryKey: true,
    },
    UserID: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    Name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    Datetime: {
      type: DataTypes.DATE,
      allowNull: false,
    },
    RouteMap: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    Distance: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    Steps: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    WasteCount: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    Duration: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
  },
  {
    timestamps: false,
    freezeTableName: true,
    tableName: "Activity",
  }
);
