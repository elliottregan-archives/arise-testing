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
      }
      {
        title: 'minim consequat cillum proident'
        description: 'Voluptate aliqua proident cupidatat veniam culpa magna esse excepteur cillum nulla.'
        category: 'Parenting'
        author: 'Manning Hensley'
        mediaType: 'Video'
      }
      {
        title: 'eu est est et'
        description: 'Ad dolor commodo veniam ea occaecat proident duis occaecat id velit exercitation pariatur.'
        category: 'Emotional Wellness'
        author: 'Young Williamson'
        mediaType: 'Video'
      }
      {
        title: 'aliqua duis est esse'
        description: 'Consequat consequat esse mollit consectetur nostrud adipisicing veniam nulla fugiat.'
        category: 'Finances'
        author: 'Gayle Russell'
        mediaType: 'Video'
      }
      {
        title: 'in nulla laboris laboris'
        description: 'Amet consectetur adipisicing nulla ex incididunt ad veniam in aliqua enim ullamco ipsum pariatur.'
        category: 'Emotional Wellness'
        author: 'Hazel Tyler'
        mediaType: 'Audio'
      }
      {
        title: 'commodo dolore laborum fugiat'
        description: 'Do eiusmod aute mollit labore enim ut culpa dolore duis Lorem veniam.'
        category: 'Finances'
        author: 'Mai Crawford'
        mediaType: 'Text'
      }
      {
        title: 'consectetur deserunt proident ea'
        description: 'Lorem occaecat id consequat incididunt quis laborum dolore ut tempor sunt sunt.'
        category: 'Finances'
        author: 'Alexandra Levy'
        mediaType: 'Video'
      }
      {
        title: 'aliqua labore ullamco ipsum'
        description: 'Eiusmod aliquip sint voluptate nostrud laborum consequat in eu ea veniam magna sint.'
        category: 'Spiritual Growth'
        author: 'Yvonne Cooper'
        mediaType: 'Audio'
      }
      {
        title: 'esse minim fugiat labore'
        description: 'Eu pariatur irure nisi ea.'
        category: 'Finances'
        author: 'Therese Burke'
        mediaType: 'Video'
      }
      {
        title: 'esse amet nostrud nisi'
        description: 'Veniam excepteur dolor cupidatat excepteur labore ea minim nisi magna.'
        category: 'Home Life'
        author: 'Levine Mclean'
        mediaType: 'Audio'
      }
      {
        title: 'excepteur occaecat elit ad'
        description: 'Occaecat sint veniam tempor laboris minim minim mollit.'
        category: 'Parenting'
        author: 'Rivas Berry'
        mediaType: 'Text'
      }
      {
        title: 'labore est quis velit'
        description: 'Sit eiusmod velit esse quis velit esse.'
        category: 'Finances'
        author: 'Brewer Watts'
        mediaType: 'Text'
      }
      {
        title: 'consectetur ipsum duis ex'
        description: 'Sit proident ad ut irure aliqua in.'
        category: 'Emotional Wellness'
        author: 'Tania Hale'
        mediaType: 'Video'
      }
      {
        title: 'eiusmod mollit labore eu'
        description: 'Et cupidatat dolore esse tempor cillum aliquip labore.'
        category: 'Emotional Wellness'
        author: 'Petty Kirkland'
        mediaType: 'Text'
      }
      {
        title: 'eu ea eiusmod nostrud'
        description: 'Sit amet aute pariatur dolore nostrud duis enim pariatur aliquip consequat deserunt.'
        category: 'Emotional Wellness'
        author: 'Cleveland Cantrell'
        mediaType: 'Audio'
      }
      {
        title: 'ad minim ullamco labore'
        description: 'Ut non incididunt pariatur mollit magna ullamco quis deserunt magna.'
        category: 'Parenting'
        author: 'Janell Acosta'
        mediaType: 'Video'
      }
      {
        title: 'aliquip ex ut eiusmod'
        description: 'Nulla proident tempor est cillum minim elit qui consequat enim aute ex voluptate.'
        category: 'Spiritual Growth'
        author: 'Ratliff Meadows'
        mediaType: 'Audio'
      }
      {
        title: 'nisi proident consectetur qui'
        description: 'Amet consequat est pariatur ullamco.'
        category: 'Finances'
        author: 'Trudy Foster'
        mediaType: 'Text'
      }
      {
        title: 'nulla enim cillum laboris'
        description: 'Non enim consequat Lorem et tempor aute mollit proident enim id dolore.'
        category: 'Spiritual Growth'
        author: 'Alyce Aguirre'
        mediaType: 'Text'
      }
      {
        title: 'sint et elit ullamco'
        description: 'Eu tempor excepteur dolore consectetur nostrud minim veniam mollit adipisicing.'
        category: 'Home Life'
        author: 'Lucille Lang'
        mediaType: 'Audio'
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

    $scope.categoryFilter = undefined
    $scope.searchParameter = ''
    $scope.categoryOptions = ['Parenting','Spiritual Growth', 'Emotional Wellness', 'Home Life', 'Finances']



    $scope.search = (item) ->
      conditions = item.title.indexOf($scope.searchParameter)!=-1 && (item.category.indexOf($scope.mediaFilter)!=-1 || $scope.mediaFilter==undefined)
      if conditions
        return true
      return false

    $scope.sortMedia = (filterParameter) ->
      $scope.mediaFilter = filterParameter

    $scope.filterOptions = [
      {
        name: "Author/Presentor"
        options: ["Firstname Lastname","Firstname2 Lastname2"]
      }
      {
        name: "Category"
        options: ['Parenting','Spiritual Growth', 'Emotional Wellness', 'Home Life', 'Finances']
      }
      {
        name: "Media Type"
        options: ["Audio", "Video", "Text"]
      }
    ]

    $scope.toggleFilterDropdown = (filterCategoryIndex) ->
      console.log $scope.filterOptions[filterCategoryIndex]
      $scope.sortDropdownVisible = !$scope.sortDropdownVisible
      if filterCategoryIndex != undefined
        $scope.filterCategories = $scope.filterOptions[filterCategoryIndex].options
        $scope.filterName = $scope.filterOptions[filterCategoryIndex].name
      

  init();
