# SuperHero

## Requirements
- iOS 13.0+
- Xcode 12.0.1

## Architecture
### Clean Architecture
I have used Clean Architecture because It is more testable, readable, and scalable than other architectures. In this architecture we have fellow parts:

- Interactor:  getting data from worker and preparing it for sending to the presenter
- Worker: get data from service
- Presenter: Preparing data and creating sections for UI
- ViewController: Binding data to UI
- Router: Navigation between modules

I have written a dependency container for using it to inject the requirements of the module into it. Dependency containers include:

- Dependency Container: It is a class that provides initializing of managers for modules just once
- Factory: It is an initializer injection for viewController which sends managers and services to interactor and worker as an initializer injection to them

I have used a data source protocol in the router to send required data when we want to navigate to other modules and I have conformed to this protocol in interactor.
For example, when I want to navigate from module superHero to SuperHeroDetails I have used this snippet:

in the router SuperHero module:

``` Swift
func navigateToSuperHeroDetail(superHeroInfo: SuperHeroInfo) {
let superHeroDetailDependencyContainer = SuperHeroDetailDependencyContainer()
let superHeroDetailViewController = superHeroDetailDependencyContainer.makeSuperHeroDetailViewController(superHeroInfo: superHeroInfo)
viewController?.navigationController?.pushViewController(superHeroDetailViewController, animated: true)
}
```

in the router SuperHeroDetails module:
``` Swift
protocol SuperHeroDetailDataPassing {
var dataStore: SuperHeroDetailDataStore? { get set }
}

class SuperHeroDetailRouter: NSObject, SuperHeroDetailDataPassing {
...
}
```

in the SuperHeroDetails interactor:
``` Swift
protocol SuperHeroDetailDataStore {
    var superHeroInfo: SuperHeroInfo? { get set }
}

class SuperHeroDetailInteractor: SuperHeroDetailDataStore {
...
}
```
in the dependency superHeroDetail container:

``` Swift
func makeSuperHeroDetailViewController(superHeroInfo: SuperHeroInfo) -> SuperHeroDetailViewController {
let vc = SuperHeroDetailViewController(factory: self)
vc.router?.dataStore?.superHeroInfo = superHeroInfo
return vc
}
```
