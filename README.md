# SuperHero

## Requirements
- iOS 13.0+
- Xcode 12.0.1

## Architecture
### Clean Architecture
I have used Clean Architecture beacause It is more testable, readable and scalibility than other architectures. In this architecture we have fellow parts:

- Interactor :  getting data from worker and preparing it for sending to presneter
- Worker : get data from service
- Presenter : Preparing data and create sections for UI
- ViewController : Binding data to UI
- Router : Naviagtion between modules

I have writen a dependency container for using it to inject requiremnets of module in it. Dependency container inculds:

- Dependency Container: 
- Factory: It is an initializer injection for viewController which sends manageres and service to interactor and worker as a initilizaer injection to them

I have used a data source protocol in router to send required data when we want to navigate to other modules and I have conformed to this protocol in interactor.
For exmaple when I want to navigate from module superHero to SuperHeroDetails I have used this snippet:

in the router module SuperHero:

``` Swift
func navigateToSuperHeroDetail(superHeroInfo: SuperHeroInfo) {
let superHeroDetailDependencyContainer = SuperHeroDetailDependencyContainer()
let superHeroDetailViewController = superHeroDetailDependencyContainer.makeSuperHeroDetailViewController(superHeroInfo: superHeroInfo)
viewController?.navigationController?.pushViewController(superHeroDetailViewController, animated: true)
}
```

in the router module SuperHeroDetails:
``` Swift
protocol SuperHeroDetailDataPassing {
var dataStore: SuperHeroDetailDataStore? { get set }
}

class SuperHeroDetailRouter: NSObject, SuperHeroDetailDataPassing {
...
}
```

in the interactor SuperHeroDetails:
``` Swift
protocol SuperHeroDetailDataStore {
    var superHeroInfo: SuperHeroInfo? { get set }
}

class SuperHeroDetailInteractor: SuperHeroDetailDataStore {
...
}
```
in the dependency container superHeroDetail:

``` Swift
func makeSuperHeroDetailViewController(superHeroInfo: SuperHeroInfo) -> SuperHeroDetailViewController {
let vc = SuperHeroDetailViewController(factory: self)
vc.router?.dataStore?.superHeroInfo = superHeroInfo
return vc
}
```
