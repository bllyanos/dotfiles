#!/usr/bin/node

const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

const mods = new Map();

function print() {
  const items = [];


  // prod
  if (mods.has("prod")) {
    items.push(mods.get("prod"));
  }

  // qa
  if (mods.has("qa")) {
    items.push(mods.get("qa"));
  }

  // time
  const now = new Date();
  const day = days[now.getDay()];
  items.push(day + " " + now.toLocaleString());


  console.log(items.join(' | '));
}

print();

setInterval(() => {
  print();
}, 1000)


// ---

async function fetchDatasaur(key, url) {
  const result = await fetch(url);
  const data = await result.json();
  const { version, status } = data;
  return `${key} ${version} ${status}`;
}

function updateDatasaur() {
  fetchDatasaur("prod", "https://app.datasaur.ai/api/health").then((data) => {
    return data;
  })
  .then(res => {
    mods.set("prod", res)
  })
  .catch(err => {
    mods.set("prod", "prod unavailable")
  });

  fetchDatasaur("qa", "https://frontend-qa.release.datasaur.ai/api/health").then((data) => {
    return data;
  })
  .then(res => {
    mods.set("qa", res)
  })
  .catch(err => {
    mods.set("qa", "qa unavailable")
  });

}

updateDatasaur();

setInterval(() => {
  updateDatasaur();
}, 60_000);
