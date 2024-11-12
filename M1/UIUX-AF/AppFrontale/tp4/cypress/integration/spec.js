describe('Make sure our todo list app is working well', () => {
    it('Test that we can open a browser and load our app', () => {
        cy.visit("http://127.0.0.1:4000");
        //cy.wait(5000); // /!\ /!\ /!\ USELESS LINE HERE <---
        // Cypress always wait before doing the next action
        // Please, do not copy that line for the rest of the TP.
    })

    it('Should clear input field after adding a new todo', () => {
        cy.visit("http://127.0.0.1:4000");
        cy.get('#new-todo-field').type("Ma tâche de l'exo 1");
        cy.get('#add-todo-btn').click();
        cy.get('#new-todo-field').should('be.empty');
    })

    it('Add a new task', () => {
        cy.visit("http://127.0.0.1:4000");
        cy.get('#new-todo-field').type("Ma tâche de l'exo 1");
        cy.get('#add-todo-btn').click();
        cy.get('#todo-0').contains('Ma tâche de l\'exo 1').should('exist');
    })

    it('Delete a task', () => {
        cy.visit("http://127.0.0.1:4000");
        cy.get('#new-todo-field').type("Ma tâche de l'exo 2");
        cy.get('#add-todo-btn').click();
        cy.get('#delete-0').click();
        cy.contains('Ma tâche de l\'exo 2').should('not.exist');
    })

    it('Counter tasks', () => {
        cy.visit("http://127.0.0.1:4000");
        cy.get("#counter").contains('0');
        cy.get('#new-todo-field').type("Ma tâche de l'exo 3");
        cy.get('#add-todo-btn').click();
        cy.get("#counter").contains('1');
        cy.get('#delete-0').click();
        cy.get("#counter").contains('0');
    })

    it('Counter color', () => {
        cy.visit("http://127.0.0.1:4000");
        cy.get("#counter").should('have.css', 'color', 'rgb(0, 0, 0)');
        for (let a = 0; a < 4; a++) {
            cy.get('#new-todo-field').type(`Ma tâche de l'exo 4 n°${a}`);
            cy.get('#add-todo-btn').click();
            cy.get("#counter").should('have.css', 'color', 'rgb(0, 0, 0)');
        }
        cy.get('#new-todo-field').type("Ma tâche de l'exo 4 n°5");
        cy.get('#add-todo-btn').click();
        cy.get("#counter").should('have.css', 'color', 'rgb(255, 0, 0)');
    })
})