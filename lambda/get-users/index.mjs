
export const handler = async (event) => {
  const users = [
    { id: 1, name: "Ahmed", role: "Admin" },
    { id: 2, name: "Sara", role: "Student" },
    { id: 3, name: "Omar", role: "Student" }
  ];

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      message: "Users retrieved successfully",
      users
    })
  };
};
