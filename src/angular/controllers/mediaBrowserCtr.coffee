mediaBrowser.controller 'mediaBrowserController', ($scope, $http, $window) ->

  init = () ->
    $scope.allAuthors = []
    $scope.sortDropdownVisible = false
    $scope.mediaIsFiltered = false


    $scope.categoryFilter = undefined
    $scope.searchParameter = ''
    $scope.categoryOptions = [
      {
        text: 'Parenting'
        icon: 'user'
      }
      {
        text: 'Spiritual Growth'
        icon: 'leaf'
      }
      {
        text: 'Emotional Wellness'
        icon: 'sun'
      }
      {
        text: 'Home Life'
        icon: 'home'
      }
      {
        text: 'Finances'
        icon: 'calculator'
      }
      {
        text: 'Health'
        icon: 'heart'
      }
    ]

    $scope.mediaOptions = [
      {
        text: 'Audio'
        icon: 'mic'
      }
      {
        text: 'Video'
        icon: 'videocam'
      }
      {
        text: 'Text'
        icon: 'doc-text'
      }
    ]
    $scope.mediaLibrary = [
      {
        title: 'minim consequat cillum proident'
        description: 'Voluptate aliqua proident cupidatat veniam culpa magna esse excepteur cillum nulla.'
        category: 'Parenting'
        author: 'Manning Hensley'
        mediaType: 'Video'
        mediaIcon: 'videocam'
        mediaIcon: 'videocam'
      }
      {
        title: 'aliquip ex ut eiusmod'
        description: 'Nulla proident tempor est cillum minim elit qui consequat enim aute ex voluptate.'
        category: 'Spiritual Growth'
        author: 'Manning Hensley'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
      {
        title: 'nisi proident consectetur qui'
        description: 'Amet consequat est pariatur ullamco.'
        category: 'Finances'
        author: 'Trudy Foster'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'nulla enim cillum laboris'
        description: 'Non enim consequat Lorem et tempor aute mollit proident enim id dolore.'
        category: 'Spiritual Growth'
        author: 'Alyce Aguirre'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'sint et elit ullamco'
        description: 'Eu tempor excepteur dolore consectetur nostrud minim veniam mollit adipisicing.'
        category: 'Home Life'
        author: 'Lucille Lang'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
    ]
    # http://www.json-generator.com/
    # [
    #   '{{repeat(20)}}',
    #   {
    #     title: "{{lorem(4, 'words')}}",
    #     description: "{{lorem()}}",
    #     category: "{{random('Parenting','Spiritual Growth', 'Emotional Wellness', 'Home Life', 'Finances')}}",
    #     author: "{{firstName()}} {{surname()}}",
    #     mediaType: "{{random('Audio', 'Video', 'Text')}}"
    #   }
    # ]
    
    angular.forEach $scope.mediaLibrary, (value, key) ->
      if value.category == 'Parenting'
        value.categoryIcon = 'user'
      if value.category == 'Spiritual Growth'
        value.categoryIcon = 'leaf'
      if value.category == 'Emotional Wellness'
        value.categoryIcon = 'sun'
      if value.category == 'Home Life'
        value.categoryIcon = 'home'
      if value.category == 'Finances'
        value.categoryIcon = 'calculator'
      if value.category == 'Health'
        value.categoryIcon = 'heart'
      if value.author
        $scope.allAuthors.push {text: value.author}
    # THIS IS THE RESOURCE REQUEST!
    $http.get('/education-resources.json')
      .success (data)->
        $scope.mediaLibrary = []
        $scope.mediaLibrary = data
        angular.forEach $scope.mediaLibrary, (value, key) ->
          if value.category == 'Parenting'
            value.categoryIcon = 'user'
          if value.category == 'Spiritual Growth'
            value.categoryIcon = 'leaf'
          if value.category == 'Emotional Wellness'
            value.categoryIcon = 'sun'
          if value.category == 'Home Life'
            value.categoryIcon = 'home'
          if value.category == 'Finances'
            value.categoryIcon = 'calculator'
          if value.category == 'Health'
            value.categoryIcon = 'heart'
          if value.author
            $scope.allAuthors.push {text: value.author}

      .error (data)->
        console.log "error!", data, status

    $scope.search = (item) ->
      filterSelected = (item.category.indexOf($scope.mediaFilter)!=-1 || item.mediaType.indexOf($scope.mediaFilter)!=-1 || item.author.indexOf($scope.mediaFilter)!=-1)
      filterNotSelected = ($scope.mediaFilter==undefined)


      conditions = (item.title.toLowerCase().indexOf($scope.searchParameter.toLowerCase())!=-1 && filterSelected) || (filterNotSelected && item.title.toLowerCase().indexOf($scope.searchParameter.toLowerCase())!=-1)
      console.log $scope.mediaFilter, $scope.searchParameter, item, conditions
      if conditions
        return true
      return false

    $scope.backToFilter = () ->
      $scope.mediaIsFiltered = false

    $scope.filterMedia = (filterParameter) ->
      $scope.mediaFilter = filterParameter
      $scope.mediaIsFiltered = true

    $scope.filterOptions = [
      {
        name: "Author"
        options: $scope.allAuthors
      }
      {
        name: "Category"
        options: $scope.categoryOptions
      }
      {
        name: "Media Type"
        options: $scope.mediaOptions
      }
    ]

    $scope.filterCategories = $scope.filterOptions[1].options
    $scope.filterName = $scope.filterOptions[1].name

    $scope.toggleFilterDropdown = (filterCategoryIndex) ->
      console.log $scope.filterOptions[filterCategoryIndex]
      $scope.sortDropdownVisible = !$scope.sortDropdownVisible
      if filterCategoryIndex != undefined
        $scope.filterCategories = $scope.filterOptions[filterCategoryIndex].options
        $scope.filterName = $scope.filterOptions[filterCategoryIndex].name

    $scope.openMedia = (url) ->
      $window.open url, "Arise Media"
      console.log "opening window....", url

  init();
  # angular.forEach $scope.mediaLibrary, (value, key) ->
  #   if value.category == 'Parenting'
  #     value.categoryIcon = 'user'
  #   if value.category == 'Spiritual Growth'
  #     value.categoryIcon = 'leaf'
  #   if value.category == 'Emotional Wellness'
  #     value.categoryIcon = 'sun'
  #   if value.category == 'Home Life'
  #     value.categoryIcon = 'home'
  #   if value.category == 'Finances'
  #     value.categoryIcon = 'calculator'
  #   if value.category == 'Health'
  #     value.categoryIcon = 'heart'
  #   if value.author
  #     $scope.allAuthors.push {text: value.author}
