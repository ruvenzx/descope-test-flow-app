
import Container from './containers';
import './App.css';
import { AuthProvider, Descope, useSession } from '@descope/react-sdk';

const AppRoot = () => {
  return (
    <AuthProvider projectId="P2c0GgXKv4F3i4UnSViLiyqVzAVT"> 
    <App/>
    </AuthProvider>
  );
}

const App = () => {
  const {isAuthenticated, isSessionLoading} = useSession();


	if (isSessionLoading) {
		return <p>Loading...</p>;
	}

  if (isAuthenticated) {
    return (
      <div className="App">
        <Container />
      </div>
    );
	}

	return <p>You are not logged in, please do:
    <Descope flowId='sign-in'></Descope>
  </p>;
};

export default AppRoot;