import React from "react";
import { Route, Routes, BrowserRouter } from "react-router-dom";
import Layout from "./components/layout";

const Container = () => {
  return (
    <BrowserRouter>
    <Routes>
      <Route path="/" element={<Layout />}>
      </Route>
    </Routes>
    </BrowserRouter>
  );
};

export default Container;