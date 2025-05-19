#!/usr/bin/env node

const readline = require("readline");

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false,
});

let firstDataLine = true;

rl.on("line", (line) => {
  if (!line.trim()) return;

  // Pass the i3bar header JSON through unmodified
  if (line.startsWith("{") && line.includes('"version"')) {
    console.log(line);
    return;
  }

  // Pass the opening "[" for the stream only once
  if (line.trim() === "[") {
    console.log("[");
    return;
  }

  const prefix = line.startsWith(",") ? "," : "";
  const jsonLine = line.replace(/^,/, "");

  let parsed;
  try {
    parsed = JSON.parse(jsonLine);
  } catch (err) {
    console.error("Failed to parse JSON:", jsonLine);
    return;
  }

  const now = new Date();
  const time = now.toLocaleString("en-GB", {
    weekday: "short",
    day: "2-digit",
    month: "2-digit",
    hour: "2-digit",
    minute: "2-digit",
    hour12: false,
    timeZoneName: "short",
  });

  const customBlock = {
    full_text: `🕒 ${time}`,
    name: "custom_clock",
    color: "#00ffff",
    markup: "pango",
  };

  parsed.push(customBlock);

  // Output the modified line with proper comma prefix
  console.log(`${prefix}${JSON.stringify(parsed)}`);
});
