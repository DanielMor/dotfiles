import Q from 'q';
import mongoose from 'mongoose';
import { map } from 'lodash';

const db = {
  name:  'mongodb://localhost/test-db',
  options: {
    useMongoClient: true,
  },
};

process.env.NODE_ENV = 'test';

mongoose.Promise = Q.Promise;

const connectMongoose = done => {
  mongoose.connect(db.name, db.options, () => {
    resetDatabase()
      .then(() => done());
  });
};

const resetDatabase = () => Q.ninvoke(mongoose.connection.db, 'dropDatabase');
const closeConnection = () => Q.ninvoke(mongoose.connection, 'close');
const close = () => resetDatabase().then(closeConnection);

const removeAll = () => Q.all(
  map(mongoose.connection.models,
    model => Q.ninvoke(model, 'remove', {})
  )
);

before(connectMongoose);

afterEach(removeAll);

after(close);
