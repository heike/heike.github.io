(function($) {
    $(document).ready(function() {
	
	$('#flights_plot').scianimator({
	    'images': ['flights_dir/flights_plot1.png', 'flights_dir/flights_plot2.png', 'flights_dir/flights_plot3.png', 'flights_dir/flights_plot4.png', 'flights_dir/flights_plot5.png', 'flights_dir/flights_plot6.png', 'flights_dir/flights_plot7.png', 'flights_dir/flights_plot8.png', 'flights_dir/flights_plot9.png', 'flights_dir/flights_plot10.png', 'flights_dir/flights_plot11.png', 'flights_dir/flights_plot12.png', 'flights_dir/flights_plot13.png', 'flights_dir/flights_plot14.png', 'flights_dir/flights_plot15.png', 'flights_dir/flights_plot16.png', 'flights_dir/flights_plot17.png', 'flights_dir/flights_plot18.png', 'flights_dir/flights_plot19.png', 'flights_dir/flights_plot20.png', 'flights_dir/flights_plot21.png', 'flights_dir/flights_plot22.png', 'flights_dir/flights_plot23.png', 'flights_dir/flights_plot24.png', 'flights_dir/flights_plot25.png', 'flights_dir/flights_plot26.png', 'flights_dir/flights_plot27.png', 'flights_dir/flights_plot28.png', 'flights_dir/flights_plot29.png', 'flights_dir/flights_plot30.png'],
	    'width': 1200,
	    'delay': 1000,
	    'loopMode': 'loop'
	});
	$('#flights_plot').scianimator('play');
    });
})(jQuery);
