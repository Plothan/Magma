# How to contribute
Magma accepts contributions, however, there are a few guidelines that you should follow. 

Magma's contributing guideline adopts the [Plethan's General Contribution Guidelines](https://github.com/Plethan/.github/blob/main/CONTRIBUTING.md) and takes inspiration from the [Fusion's contributing guidelines](https://github.com/Elttob/Fusion/blob/main/CONTRIBUTING.md) 

## I found a non-security bug or issue

We are always looking for bug reports to make sure Magma is functioning the best it can. While we do maintain our unit tests, issues can slip through. You can do the following when you find one: 

* **You're not the first one to report it**: Make sure that your issue isn't a duplicate of a closed/open issue.
    * If an issue is found to be a duplicate, it is clsoed and you will be redirected to the orignial one
    * If an issue was closed due to being fixed, you can open a new one if there was new unintended behavior.

* **Only if your issue isn't a duplicate of an existing issue,** you may open a new one.
    * Your title should be clear, concise, and adequately summarise the issue. Titles like 'Why is this broken?' and 'my code doesn't work' aren't helpful.
    * Include as much relevant information as possible. We can't diagnose the issue if we don't know anything about it.
    * Please include simple, clear and easy-to-follow reproduction steps. You may include a .rbxl file if you need some existing non-trivial setup.

* When your issue is noticed by a project maintainer, it will be labelled appropriately.
    * Bugs start out labelled as 'status: evaluating'. This occurs as soon as we notice the issue. At this stage, we have not verified the bug for ourselves.
    * When the bug is verified, it will be labelled as 'status: needs design' if there is not an obvious or immediately actionable solution. This often occurs with bugs whose fixes would be breaking changes.
    * Once a solution has been identified and approved. it will be labelled as 'status: approved'. Approved bugs will be fixed in a future version of Fusion, and will be closed once the fix ships.

* Be patient - all project maintainers are voluteers, so it will likely take some time to respond.
    * Don't bump or chase up your issue - commenting 'Any updates on this?' does not add value to the conversation, and only clutters the issue.

## I have an idea or a feature to request
We're always looking for features so we can expand Magma's capabilities.

Here are some guidelines on what features we tend to accept:

* Features that are very easy to use.
    * Users shouldn't be doing a lot of work just for a simple concept.

* Features that lead to more performant patterns.
    * Code that use the feature often uses performant data structures and algrotihms.

* Features that will be better-served when are supported by the library
    * Internal code is often consistent and doesn't behave weirdly in edge-cases.


Here are some guidelines on what features we tend to reject:

* Does not serve the majority of users.
    * Magma is designed to be built upon, as such, features that don't get used by the majority of users should be served by third-party libraries instead.

* Optimized for writability.
    * Code is often written once and then get read and reviewed many times, as such, we should focus more on optimizing for readability.


If you believe your idea fits what we like to see, please continue:

* **You're not the first one to suggest it:** Make sure that your idea isn't a duplicate of a closed/open issue.
    * If an issue is found to be a duplicate, it is clsoed and you will be redirected to the orignial one

* **Only if your issue isn't a duplicate of an existing issue,** you may open a new one.
    * Your title should be clear, concise, and adequately summarise the idea.
    * Avoid exclusively talking about specific solutions to problems - your feature request should describe the general case for why a feature should be added. Focus on who your feature request would help, when it would help them and why.
    * That said, please feel free to suggest hypothetical API designs, as long as they're not the focus. Remember that we value APIs that are as simple and low-tech as possible.

* When your issue is noticed by a project maintainer, it will be labelled appropriately.
    * Enhancements start out labelled as 'status: evaluating'. This occurs as soon as we notice the issue. At this stage, we are gathering community sentiment and evaluating whether the idea aligns with our vision for Magma.
    * If we like the general idea, it will be labelled as 'status: needs design' This means we would like to include your idea, but don't have a solid idea of how it should look and function in Magma.
    * Once a design has been identified and approved. it will be labelled as 'status: approved'. Approved features will be fixed in a future version of Fusion, and will be closed once the feature ships.
    
* Be patient - all project maintainers are voluteers, so it will likely take some time to respond.
    * Don't bump or chase up your issue - commenting 'Any updates on this?' does not add value to the conversation, and only clutters the issue.


## I want to make a code modification or open a pull request
While pull requests are appericated, Magma is currently completel-managed by it's maintainers. 
