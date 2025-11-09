# Engineering culture

Engineering Culture values derive from Company culture and Agile Software Development values. We believe they complement each other in the right way and enable us to create innovative mobile devices that people love while ensuring the highest standards of privacy and data protection. We seek to push the boundaries of mobile technology to achieve new and exciting advancements. We automate and continuously integrate to make our products great.

\
In **Agile way of working,** we value:

* **Individuals and interactions** over processes and tools
* **Working software** over comprehensive documentation
* **Customer collaboration** over contract negotiation
* **Responding to change** over following a plan

That is, while there is value in the items on the right, we value the things on the left more.\
You can find more information about the twelve principles of the Agile Manifesto (written above) [here](http://agilemanifesto.org/principles.html).\
\
In Software Engineering there are two teams: **Quality Assurance and Software Development.** The Development Department is divided in two teams that need to deliver features every release cycle - Feature OS Team and Apps Team. We use the **Scrum Framework** for the Apps Team. It is a framework within which people can address complex adaptive problems, while productively and creatively delivering products of the highest possible value. The essence of Scrum is a small team of people - **Apps Team - Scrum**, and their associated **roles, events, artifacts, and rules**. The team is highly flexible, adaptive, and collaborative.\
Our talented engineers are at the cutting edge of driving our business forward with advancing technology. Building great software is as much about behavior as it is about coding. Our engineers are responsible for more than just coding. To create excellence requires a commitment to and ownership of the development processes. By committing to this Engineering Culture, we can perform better and achieve so much more together.



### Coding Standartds

* We follow the general Android coding style (default for Android Studio which is listed in the [Android website](http://developer.android.com/))
* We follow the Android Naming convention and naming conventions provided by Java/Kotlin coding standards.
* We format code and file structure using "ctrl + alt + L" everywhere so that the code remains consistent and easy to understand.
* Commit naming – the name must contain the task number, and it should briefly explain the implementation or problem it fixes.

### Code Reviews

* At least two other developers must review each commit before it is tested.
* If the scope of the review is too big, we estimate additional time.
* During the code review, all Unit tests should be passing. They are automatically run by Bamboo, and prevent in Bitbucket a pull request to be merged.
* Each review should focus on evaluating code quality. If you are reviewing a fixed bug, the solution should be the simplest one.
* If a bug requires refactoring or a change in design and architecture, it should be planned separately as an improvement.
* If feature implementation is reviewed, the reviewer should make sure he/she knows the implementation logic. Check it covers all the acceptance criteria.
* Code reviews are done at the start of each working day to avoid disrupting other daily activities. Items should spend the minimum possible time in the "In Review" stage.



### Architecture

* We aim for scalable, easy to explain and support, design of architecture without implying over-engineering.
* We follow SOLID principles and Clean Architecture patterns. We meet and present the new plan, and if it has any team dependency, the team is asked to join.
* Everyone is welcome to share an opinion regardless of seniority.



### Programming Language

* We prefer to use known and proven languages.
* We explore new options but only implement them if the benefit is confirmed and if maturity is high enough.



### Testing

* We follow TDD, so each new feature must be tested. Our goal is 100% test coverage of new features so each merge request goes through QA.
* Everyone is responsible for the quality, and this starts from the planning stage, goes through development, and ends up with testing.
* Each team member tests their work before handing it over. This way we can ensure no time is wasted on small defects caused by underlooking a ticket.

### Build vs. Buy

* We prefer to build most of our environment and tools.
* Buying sometimes requires a higher investment than just the price of the tool.
* A key concern is our customers' privacy, and we cannot rely on others to protect that.



### Security and Data Privacy

* User privacy is a core goal.
* We do not store private information or take information without first requesting it.
* When we need user data, we have to request permission first to the user and bring awareness to him/her of the need behind this request.
