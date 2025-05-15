import {BrowserRouter} from "react-router-dom";
import MainContainer from './components/react/MainContainer';

function App() {
   return (
      <div>
         <BrowserRouter>
            <MainContainer/>
         </BrowserRouter>
      </div>
   );
}

export default App;
