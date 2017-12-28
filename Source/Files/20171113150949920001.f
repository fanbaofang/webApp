<!VDNDOC "PageBase":"nvo_chart","IniEvent":"PageIni","NotClientCache":true>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<title>VDN+ECahrt 示例</title>
		<meta name="viewport" content="width=device-width, initial-scale=1,maximum-scale=1,user-scalable=no">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<!--标准mui.css-->
		<link rel="stylesheet" href="css/mui.min.css">
		<!--App自定义的css-->
		<link rel="stylesheet" type="text/css" href="css/app.css" />
		<style>
			.chart {
				height: 200px;
				margin: 0px;
				padding: 0px;
			}
			h5 {
				margin-top: 30px;
				font-weight: bold;
			}
			h5:first-child {
				margin-top: 15px;
			}
		</style>
	</head>

	<body>
		<!--header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">chart（EChart图表）</h1-->
		</header>
		<div class="mui-content">
			<div class="mui-content-padded">
				<p style="text-indent: 22px;">本例数据使用VDN的动态嵌入，通过后台PB程序加载数据前台解析展示。后台对应nvo_chart。</p>
				<p style="text-indent: 22px;">
					这是mui集成百度ECharts的图表示例，ECharts的详细用法及 API 请参考其官方网站: <a id='echarts' data-url='http://echarts.baidu.com'>http://echarts.baidu.com</a>
				</p>
			</div>
			<div class="mui-content-padded">
				<h5>柱图示例</h5>
				<div class="chart" id="barChart"></div>
				<h5>线图示例</h5>
				<div class="chart" id="lineChart"></div>
				<h5>饼图示例</h5>
				<div class="chart" id="pieChart"></div>
			</div>
		</div>
		<script src="js/mui.min.js"></script>
		<script src="libs/echarts-all.js"></script>
		<script>
			var getOption = function(chartType) {
				var chartOption = chartType == 'pie' ? {
					calculable: false,
					series: [{
						name: '分店预约量',
						type: 'pie',
						radius: '65%',
						center: ['50%', '50%'],
						data: [/*<!--INCLUDE:DataPie;JS-->*/]
					}]
				} : {
					legend: {
						data: [/*<!--INCLUDE:DataLegend;JS-->*/]
					},
					grid: {
						x: 35,
						x2: 10,
						y: 30,
						y2: 25
					},
					toolbox: {
						show: false,
						feature: {
							mark: {
								show: true
							},
							dataView: {
								show: true,
								readOnly: false
							},
							magicType: {
								show: true,
								type: ['line', 'bar']
							},
							restore: {
								show: true
							},
							saveAsImage: {
								show: true
							}
						}
					},
					calculable: false,
					xAxis: [{
						type: 'category',
						data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
					}],
					yAxis: [{
						type: 'value',
						splitArea: {
							show: true
						}
					}],
					series: [/*<!--INCLUDE:DataSeries;JS-->*/]
				};
				return chartOption;
			};
			var byId = function(id) {
				return document.getElementById(id);
			};
			var barChart = echarts.init(byId('barChart'));
			barChart.setOption(getOption('bar'));
			var lineChart = echarts.init(byId('lineChart'));
			lineChart.setOption(getOption('line'));
			var pieChart = echarts.init(byId('pieChart'));
			pieChart.setOption(getOption('pie'));
			byId("echarts").addEventListener('tap',function(){
				var url = this.getAttribute('data-url');
				plus.runtime.openURL(url);
			},false);
			
			//msg
			mui.toast('本例数据使用VDN的动态嵌入，通过后台PB程序加载数据前台解析展示。');
		</script>
	</body>

</html> 