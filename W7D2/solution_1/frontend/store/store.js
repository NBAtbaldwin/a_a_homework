import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const logger = store => next => action => {
    console.log(store.getState());
    console.log(action);
    const result = next(action);
    console.log(store.getState());
    return result;
  };

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(logger));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
