mediaBrowser.controller 'mediaBrowserController', ($scope) ->


  init = () ->
    console.log("index!")
    $scope.mediaLibrary = [
      {
        title: 'amet ullamco velit velit'
        description: 'Non labore reprehenderit velit id consectetur in velit ea commodo labore dolore mollit in est.'
        category: 'Parenting'
        author: 'Tamara Leach'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
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
        title: 'eu est est et'
        description: 'Ad dolor commodo veniam ea occaecat proident duis occaecat id velit exercitation pariatur.'
        category: 'Emotional Wellness'
        author: 'Young Williamson'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'aliqua duis est esse'
        description: 'Consequat consequat esse mollit consectetur nostrud adipisicing veniam nulla fugiat.'
        category: 'Finances'
        author: 'Gayle Russell'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'in nulla laboris laboris'
        description: 'Amet consectetur adipisicing nulla ex incididunt ad veniam in aliqua enim ullamco ipsum pariatur.'
        category: 'Emotional Wellness'
        author: 'Hazel Tyler'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
      {
        title: 'commodo dolore laborum fugiat'
        description: 'Do eiusmod aute mollit labore enim ut culpa dolore duis Lorem veniam.'
        category: 'Finances'
        author: 'Mai Crawford'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'consectetur deserunt proident ea'
        description: 'Lorem occaecat id consequat incididunt quis laborum dolore ut tempor sunt sunt.'
        category: 'Finances'
        author: 'Alexandra Levy'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'aliqua labore ullamco ipsum'
        description: 'Eiusmod aliquip sint voluptate nostrud laborum consequat in eu ea veniam magna sint.'
        category: 'Spiritual Growth'
        author: 'Yvonne Cooper'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
      {
        title: 'esse minim fugiat labore'
        description: 'Eu pariatur irure nisi ea.'
        category: 'Finances'
        author: 'Therese Burke'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'esse amet nostrud nisi'
        description: 'Veniam excepteur dolor cupidatat excepteur labore ea minim nisi magna.'
        category: 'Home Life'
        author: 'Levine Mclean'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
      {
        title: 'excepteur occaecat elit ad'
        description: 'Occaecat sint veniam tempor laboris minim minim mollit.'
        category: 'Parenting'
        author: 'Rivas Berry'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'labore est quis velit'
        description: 'Sit eiusmod velit esse quis velit esse.'
        category: 'Finances'
        author: 'Brewer Watts'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'consectetur ipsum duis ex'
        description: 'Sit proident ad ut irure aliqua in.'
        category: 'Emotional Wellness'
        author: 'Tania Hale'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'eiusmod mollit labore eu'
        description: 'Et cupidatat dolore esse tempor cillum aliquip labore.'
        category: 'Emotional Wellness'
        author: 'Petty Kirkland'
        mediaType: 'Text'
        mediaIcon: 'doc-text'
      }
      {
        title: 'eu ea eiusmod nostrud'
        description: 'Sit amet aute pariatur dolore nostrud duis enim pariatur aliquip consequat deserunt.'
        category: 'Emotional Wellness'
        author: 'Cleveland Cantrell'
        mediaType: 'Audio'
        mediaIcon: 'mic'
      }
      {
        title: 'ad minim ullamco labore'
        description: 'Ut non incididunt pariatur mollit magna ullamco quis deserunt magna.'
        category: 'Parenting'
        author: 'Janell Acosta'
        mediaType: 'Video'
        mediaIcon: 'videocam'
      }
      {
        title: 'aliquip ex ut eiusmod'
        description: 'Nulla proident tempor est cillum minim elit qui consequat enim aute ex voluptate.'
        category: 'Spiritual Growth'
        author: 'Ratliff Meadows'
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

    angular.forEach $scope.mediaLibrary, (value, key) ->
      if value.category == 'Spiritual Growth'
        value.categoryIcon = 'leaf'

    $scope.search = (item) ->
      conditions = item.title.indexOf($scope.searchParameter)!=-1 && (item.category.indexOf($scope.mediaFilter)!=-1 || $scope.mediaFilter==undefined)
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
        name: "Author/Presentor"
        options: ["Firstname Lastname","Firstname2 Lastname2"]
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
      

  init();
