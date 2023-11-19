// Toggle Body and vertical side bar
var menuIcon = document.querySelector("#menu-icon");
var sidebar = document.querySelector(".main-sidebar");
var mainbody = document.querySelector(".main-body");
menuIcon.onclick = function () {
  sidebar.classList.toggle("small-sidebar");
  mainbody.classList.toggle("main-body-large");
};


// Show profile hide profile
var profile = document.querySelector(".settings-menu");
var profileshow = document.querySelector("#showprofilemenu");
var profilehide = document.querySelector("#showprofilemenu1");
profileshow.onclick = function () {
  profile.classList.toggle("settings-menu-open");
};
profilehide.onclick = function () {
  profile.classList.toggle("settings-menu-open");
};


// Edit Profile =======================================================
function openForm() {
  document.getElementById("EditProfile").style.display = "block";
}

function closeForm() {
  document.getElementById("EditProfile").style.display = "none";
}
// add batch =======================================================
function openaddbatch() {
  document.getElementById("Addbatch").style.display = "block";
}

function closeaddbatch() {
  document.getElementById("Addbatch").style.display = "none";
}
// show batch =======================================================
function showbatch() {
  document.getElementById("batchlist").style.display = "block";
}

function closebatch() {
  document.getElementById("batchlist").style.display = "none";
}
// edit batch =======================================================
/*function editbatchopen() {
  document.getElementById("editbatch").style.display = "block";
}*/

function editbatchclose() {
  document.getElementById("editbatch").style.display = "none";
}
function addstudclose() {
  document.getElementById("addstudent").style.display = "none";
}

function showexam() {
  document.getElementById("AddExam").style.display = "block";
}
function closeshowbatch() {
  document.getElementById("AddExam").style.display = "none";
}

function editexamclose() {
  document.getElementById("editexam").style.display = "none";
}
function addquesclose() {
  document.getElementById("addques").style.display = "none";
}

function showen() {
  document.getElementById("enroll").style.display = "block";
}
function closeen() {
  document.getElementById("enroll").style.display = "none";
}












// DateTime
const displayTime = document.querySelector(".display-time");
// Time
function showTime() {
  let time = new Date();
  displayTime.innerText = time.toLocaleTimeString("en-US", { hour12: false });
  setTimeout(showTime, 1000);
}

showTime();

// Date
function updateDate() {
  let today = new Date();

  // return number
  let dayName = today.getDay(),
    dayNum = today.getDate(),
    month = today.getMonth(),
    year = today.getFullYear();

  const months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  const dayWeek = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
  ];
  // value -> ID of the html element
  const IDCollection = ["day", "daynum", "month", "year"];
  // return value array with number as a index
  const val = [dayWeek[dayName], dayNum, months[month], year];
  for (let i = 0; i < IDCollection.length; i++) {
    document.getElementById(IDCollection[i]).firstChild.nodeValue = val[i];
  }
}

updateDate();
