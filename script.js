let questionIndex = 0;

let titles = [
  "Software: Use case",
  "Computer knowledge",
  "Linux Knowledge",
  "Installation: Presets",
  "Installation: Live Test needed",
  "Installation: Hardware support",
  "Configuration: Help source",
  "Distributions: User experience",
  "Distributions: Price",
  "Distributions: Scope",
  "Distributions: Ideology",
  "Distributions: Privacy",
  "Distributions: Preset themes, icons and wallpapers",
  "Distributions: Special features",
  "Software: Administration",
  "Software: Updates",
];

let questions = [
  "Some distributions are made for a special purpose, some for daily use. What do you need?",
  "How would I rate my knowledge using my computer?",
  "How would I rate my knowledge with Linux itself?",
  "How many preferences do you wish to change by yourself during installation? How many configuration variables should be filled out with a default value?",
  "Most of the distributions include the possibility to start from USB-Stick or DVD to test the distribution without changing your computer. Some distributions can be installed on the USB-Stick itself with your data and settings stored on the USB-Stick ('persistent installation').",
  "It is important to know how old is the system because some distributions won't run on old computers. The main reason for this is the dropped support for older technologies, like the 32-bit processor architecture in favor of the 64-bit architecture.",
  "Some distributions prefer articles in wikis for troubleshooting. What do I prefer?",
  "Linux can use a lot of different User Interfaces ('Desktops'). Many distributions ship one desktop as default. It is important to know if there are any preferences for a concept. You can switch and install new desktops at any time!",
  "Most distributions are free. Some distributions offer additional support for an (initial) fee.",
  "Different Distributions install a different amount of programs. Some are installing a complete amount of programs to work 'out of the box'. Other distributions installing only a base install to let the user decide what software to use.",
  "The (license) ideology of a distribution is always a contentious debate. There are distributions using mostly 'free-licenses', others also use 'nonfree' software. Free licenses allow the user to modify, redistribute and use the software for any purpose. There are situations where a distribution has to use non-free software, for example for drivers. Nonfree software does not distribute it's sourcecode and modifications are not allowed. It is important to know if you have some preferences in a license model.",
  "Some distributions use online services to improve the user experience. This may affect the privacy of the user, the user can be tracked when using such online features.",
  "Some distributions are shipping programs or desktops with own themes or icon sets to create a complete user experience.",
  "Some distributions may use special features, such as security enhancements. Which of the following features do I want to use (if any)?",
  "On Linux you can install software on different ways. You can build software from the sourcecode or install them via packages. What do I prefer?",
  "Some distributions offer faster updates, which can affect system stability. What do you prefer?",
];

let optionsList = [
  {
    type: "checkbox",
    val: [
      "I want to use Linux for daily use.",
      "I want to use Linux for anonymous web browsing.",
      "I want to use Linux for data rescue.",
      "I prefer a distribution which is supported by game publishers.",
      "I want to use the distribution for scientific purposes.",
    ],
  },
  {
    type: "radio",
    val: [
      "I often need help by other users troubleshooting problems with my computer.",
      "I am already able to solve some problems with my computer by myself.",
      "I can troubleshoot problems with my computer by myself.",
    ],
  },
  {
    type: "radio",
    val: [
      "I do not have any or just a little knowledge about Linux.",
      "I already used Linux for some purposes.",
      "I have a good knowledge about the Linux operating system.",
    ],
  },
  {
    type: "radio",
    val: [
      "I want to use the default preset values in the installation assistant.",
      "I do not need preset values in installation assistants or while doing the configuration of the system.",
      "I prefer to do as many settings using graphical interfaces by myself",
    ],
  },
  {
    type: "checkbox",
    val: [
      "I want to install Linux the 'classical way' on the hard disk of my computer.",
      "I want to install Linux on a USB flash drive.",
      "I want to test Linux first by booting from USB or DVD without changing anything on my computer.",
    ],
  },
  {
    type: "radio",
    val: [
      "My computer should support the 64 bit architecture (all computers of the last 5 years should have support for this).",
      "I'm not sure about this and/ or my computer already has performance issues.",
    ],
  },
  {
    type: "radio",
    val: [
      "I am able to solve my problems using guides from wiki pages or tutorials.",
      "I prefer asking other users for help.",
    ],
  },
  {
    type: "checkbox",
    val: [
      "I prefer a windows like user interface.",
      "I prefer a macOS like user interface.",
      "I do not prefer any user interface style.",
    ],
  },
  {
    type: "checkbox",
    val: [
      "I can afford a fee to use the distribution.",
      "I prefer a free-to-use distribution.",
    ],
  },
  {
    type: "radio",
    val: [
      "I prefer a distribution shipping all the programs I need to start working immediate after installation.",
      "I want to select the programs to install by myself.",
    ],
  },
  {
    type: "radio",
    val: [
      "I want to use free licenses as much as I can",
      "I'm fine with unfree licenses as long as my system works.",
    ],
  },
  {
    type: "radio",
    val: [
      "If it improves my user experience, I agree with using such online services.",
      "I do not want this.",
    ],
  },
  {
    type: "radio",
    val: [
      "This is important to me.",
      "I do not appreciate this. I will install icons, wallpapers and themes by myself.",
    ],
  },
  {
    type: "checkbox",
    val: [
      "I wish to run all applications in isolated containers. I am aware that this may cause the distribution more difficult to use.",
      "I know what 'systemd' is and wish to avoid that.",
      "I wish to install packages from other distributions without additional effort.",
      "I don't want to use package managers. I wish to install everything from source.",
    ],
  },
  {
    type: "checkbox",
    val: [
      "I want to install my programs using a kind of 'App store'.",
      "I want to install software mostly using terminal commands.",
    ],
  },
  {
    type: "radio",
    val: ["I prefer fast updates.", "I prefer stable updates."],
  },
];

function renderQuestion() {
  let title = document.getElementById("title");
  let question = document.getElementById("question");
  let options = document.getElementById("options");

  title.innerHTML = titles[questionIndex];
  question.innerHTML = questions[questionIndex];

  let optionsInnerHTML = "";
  options.innerHTML = "";

  for (var i = 0; i < optionsList[questionIndex]["val"].length; ++i) {
    optionsInnerHTML +=
      '<div class="optionItem">' +
      '<input type="' +
      optionsList[questionIndex]["type"] +
      '" name="magik" id="' +
      i.toString() +
      '" />' +
      '<label for="' +
      i.toString() +
      '">' +
      optionsList[questionIndex]["val"][i] +
      "</label></div>";
  }
  options.innerHTML = optionsInnerHTML;
  ++questionIndex;
}

function startQuiz() {
  questionIndex = 0;

  let intro = document.getElementById("intro");
  intro.style.display = "none";

  let quizButtons = document.getElementsByClassName("quizButtons");
  quizButtons[0].style.display = "inline";

  let start = document.getElementById("start");
  start.style.display = "none";

  let quiz = document.getElementById("quiz");
  quiz.style.display = "block";

  renderQuestion();
}

function onClickNext() {
  if (questionIndex < titles.length) {
    renderQuestion();
  } else {
    let quizButtons = document.getElementsByClassName("quizButtons");
    quizButtons[0].style.display = "none";

    let quiz = document.getElementById("quiz");
    quiz.style.display = "none";

    let resultPage = document.getElementById("result");
    resultPage.style.display = "block";

    document.body.className += ' joke';
  }
}
