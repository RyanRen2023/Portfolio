/**
 *   Name:   Xihai Ren
 *   Course: CST8285 332 Web Programming Lab
 *   Date: Mar 7,2024
 *   Description: Assignment 1 JavaScript File
 */

/**
 * fuction myFormSubmit deal with the form submin and submit the form.
 * @param {*} event html event  onclick
 * @returns  do nothing
 */
function myformSubmit(event) {
    event.preventDefault(); // prevent default submit

    const nameInput = document.getElementById("name");
    const emailInput = document.getElementById("email");
    const messageInput = document.getElementById("message");

    const name = nameInput.value.trim();
    const email = emailInput.value;
    const message = messageInput.value;

    if (name === '') { // name should not be null or blank
        nameInput.classList.add('error');
        return;
    }

    const confirmSubmit = confirm("Are you sure you want to submit?");

    if (confirmSubmit) {
        alert("Thank you for your submission!\n" + name + ' ' + email + " " + message);
        document.getElementById('contact-form').submit();
    }
}

/**
 * declare a project array.
 */
var projectsArray = ["project1", "project2", "project3", "project4"];
/**
 * declare a funciton responsible for toggling projects.
 * @param {*} id projectid
 */
function toggleProjectDisplay(id) {
    for (let i = 0; i < projectsArray.length; i++) {
        const projectElement = document.getElementById(projectsArray[i]);
        if (projectElement != null) {
            if (i === id) {
                projectElement.style.display = 'block';
                document.getElementById("currentProject").value = id;
            } else {
                projectElement.style.display = 'none';
            }
        }

    }

}


/**
 * declare a function that is used to init the first show project.
 */
function initProject() {
    toggleProjectDisplay(0);
    initialButtons(0);

}
/**
 * show the project according to project id
 * @param {*} id the project id
 */
function showProject(id) {
    toggleProjectDisplay(id);
    initialButtons(id);
}
/**
 * according to the status to decide which project should be display
 * @param {*} status previous or next
 */
function toggleProject(status) {
    const currentId = parseInt(document.getElementById("currentProject").value, 10);
    let newId = 0;

    if (status === 'next') {
        if (currentId < projectsArray.length - 1) {
            newId = currentId + 1;
        } else {
            newId = currentId;
        }

    } else if (status === 'previous') {
        if (currentId > 0) {
            newId = currentId - 1;
        }
    }
    showProject(newId);
}
/**
 * according to id to change the button's state.
 * @param {*} id  projectId
 */
function initialButtons(id) {
    const preProjectButtons = document.getElementsByName("preProject");
    const nextProjectButtons = document.getElementsByName('nextProject');

    preProjectButtons.forEach(button => {
        if (id === 0) {
            button.disabled = true;
            button.classList.add('disabled');
        } else {
            button.disabled = false;
            button.classList.remove('disabled');
        }

    });
    nextProjectButtons.forEach(button => {
        if (id === projectsArray.length - 1) {
            button.disabled = true;
            button.classList.add('disabled');
        } else {
            button.disabled = false;
            button.classList.remove('disabled');
        }

    });
}

/**
 * call the function
 */
initProject();


