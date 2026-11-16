
import { timingSafeEqual } from "node:crypto";

function safeEqual(actual, expected) {
  if (typeof actual !== "string" || typeof expected !== "string") {
    return false;
  }

  const a = Buffer.from(actual);
  const b = Buffer.from(expected);

  return (
    a.length === b.length &&
    timingSafeEqual(a, b)
  );
}

export const handler = async (event) => {
  const headers = Object.fromEntries(
    Object.entries(event.headers || {}).map(
      ([key, value]) => [key.toLowerCase(), value]
    )
  );

  const environment = headers["x-environment"];
  const studentId = headers["x-student-id"];
  const token = headers["x-internal-token"];

  const validEnvironment =
    environment === process.env.EXPECTED_ENV;

  const validStudentId =
    Boolean(studentId) &&
    studentId === process.env.EXPECTED_STUDENT_ID;

  const validToken =
    Boolean(process.env.EXPECTED_TOKEN) &&
    safeEqual(token, process.env.EXPECTED_TOKEN);

  const isAuthorized = Boolean(
    validEnvironment &&
    validStudentId &&
    validToken
  );

  console.log("Authorization result:", {
    authorized: isAuthorized,
    validEnvironment,
    validStudentId: Boolean(validStudentId),
    validToken
  });

  return {
    isAuthorized,
    context: {
      studentId: validStudentId ? studentId : "unknown"
    }
  };
};
