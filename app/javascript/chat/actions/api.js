import axios from "axios";

const ROOT_URL = "/api/v1";

class Api {
  static async get(query) {
    const res = await axios.get(`${ROOT_URL}${query}`);
    if (res.status >= 200 && res.status <= 207) {
      return res.data;
    } else {
      throw new Error(`HTTP status ${res.status}`);
    }
  }

  static async post(query) {
    post_body = {
      my_request: 'hello'
    }
    const res = await axios.post(`${ROOT_URL}${query}`, post_body);
    if (res.status >= 200 && res.status <= 207) {
      return res.data;
    } else {
      throw new Error(`HTTP status ${res.status}`);
    }
  }
}

export default Api;