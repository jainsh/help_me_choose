$ ->
  $("#container").highcharts
    chart:
      type: "bar"

    title:
      text: "Plan Comparison"

    plotOptions:
      bar:
        stacking: "normal"

    legend:
      reversed: true

    xAxis:
      categories: _(_(gon.plans).pluck('name')).compact()

    yAxis:
      title:
        text: "Cost (in dollars)"
      tickInterval: 500

    series: [
      {
        name: "Services / Care"
        color: "#94B8FF"
        data: [
          1100
          2200
          3300
        ]
      }
      {
        name: "Annual Premium"
        color: "#BC5959"
        data: gon.premiums
      }
    ]

  return