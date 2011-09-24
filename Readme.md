# SquareApp

Not an App in the App Store sense of the word, but an implementation of the App described in [Square](https://squareup.com/)'s [job application for iOS developers](https://squareup.com/jobs/oMYtVfwS).

> **Include an answer to the following question with your resume and cover letter**
> Assume you have an Employee class which defines four properties: name, job title, date of birth, and number of years employed. Create an iOS app which consists of a UITableView for displaying a list of Employees. It should scroll smoothly and look beautiful, but the design is up to you. Bonus points for including a photo of the user, multiple device support, and attention to detail.

That makes this an *application for an application*. How meta.

## What it Does

- Has an employee class with the desired properties above, as well as the `imageName` property for displaying an image.
- Custom `UIViewController` and `UITableViewCell` subclasses, not too special.
- Contains stlying à la other tijo Apps (i.e. [wootvetica](http://j.mp/wootvetica), [FaceType](https://github.com/tijoinc/facetype), and the now defunct NGadget).

## Potential Improvements

- Loading and caching of employee information offline
- More dynamic storage, currently a simple `NSArray` within the App stores employee data. Migration to CoreData would be cool.
- Loading and caching of employee images offline using something like [AFNetworking](https://github.com/gowalla/AFNetworking)