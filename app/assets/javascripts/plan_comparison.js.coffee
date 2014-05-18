$ ->
  $("#container").highcharts
    chart:
      type: "bar"

    title:
      text: "Plan Comparison"

    xAxis:
      categories: [
        "Aetna PPO / Coinsurance 80%"
        "Aetna PPO / Coinsurance 70%"
        "Aetna 5000 High Deductible w/HSA"
      ]

    yAxis:
      title:
        text: "Fruit eaten"

    series: [
      {
        name: "Jane"
        data: [
          1
          0
          4
        ]
      }
      {
        name: "John"
        data: [
          5
          7
          3
        ]
      }
    ]

  return