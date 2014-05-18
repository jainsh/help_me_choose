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
      labels:
        formatter: ->
          "<span class='plan-name'>" + @value + "</span><br/><b>Max Out-of-Pocket:</b> $" +
          gon.max_oops[@value] +
          "<br/><b>Annual Deductible:</b> $" +
          gon.deductibles[@value]

    yAxis:
      title:
        text: "Cost (in dollars)"
      tickInterval: 500

    series: [
      {
        name: "Services / Care"
        color: "#94B8FF"
        data: gon.cost_totals
      }
      {
        name: "Annual Premium"
        color: "#BC5959"
        data: gon.premiums
      }
    ]

  return