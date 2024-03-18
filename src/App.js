
import Container from './containers';
import './App.css';
import { AuthProvider } from '@descope/react-sdk';

const AppRoot = () => {
  return (
    <AuthProvider projectId="P2c0GgXKv4F3i4UnSViLiyqVzAVT" flowId="sign-in"> 
    <App/>
    </AuthProvider>
  );
}

const App = () => {
  return (
    <div className="App">
      <Container />
    </div>
  );
};

export default AppRoot;
