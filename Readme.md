# SquareApp

Not an App in the App Store sense of the word, but an implementation of the App described in [Square](https://squareup.com/)'s [job application for iOS developers](https://squareup.com/jobs/oMYtVfwS). So it's an App for an App.

## Potential Improvements

- Loading and caching of employee information offline
- More dynamic storage, currently a simple `NSArray` within the App stores employee data. Migration to `CoreData` would be cool.
- Loading and caching of employee images offline using something like [AFNetworking](https://github.com/gowalla/AFNetworking)