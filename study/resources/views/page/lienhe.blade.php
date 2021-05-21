@extends('master')
@section('content')
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Liên hệ</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{route('trang-chu')}}">Home</a> / <span>Liên hệ</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="beta-map">
		
		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13068.67511850549!2d106.80194596521888!3d10.873257607799715!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d8a5f4e477e9%3A0x29d5aeb365cee20b!2sKTX%20Khu%20A%20%C4%90HQG%20TP.HCM!5e0!3m2!1svi!2s!4v1575884634254!5m2!1svi!2s" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe></div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Form Liên hệ</h2>
					<div class="space20">&nbsp;</div>
					<p>Cảm ơn bạn đã chọn chúng mình!<br/>Hãy để lại lời nhắn để chúng mình có cơ hội cải thiện tốt hơn bạn nhé! Yêu!</p>
					<div class="space20">&nbsp;</div>
					<form action="#" method="post" class="contact-form">	
						<div class="form-block">
							<input name="your-name" type="text" placeholder="Tên của bạn (bắt buộc)">
						</div>
						<div class="form-block">
							<input name="your-email" type="email" placeholder="Email của bạn (bắt buộc)">
						</div>
						<div class="form-block">
							<input name="your-subject" type="text" placeholder="Chủ đề">
						</div>
						<div class="form-block">
							<textarea name="your-message" placeholder="Nhắn nhủ của bạn"></textarea>
						</div>
						<div class="form-block">
							<button type="submit" class="beta-btn primary">Gửi nào! <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên lạc</h2>
					<div class="space20">&nbsp;</div>

					<h5 class="contact-title">Địa chỉ</h5>
					<p>
						KTX A - ĐHQG, khu phố 6,<br>
						Linh Trung, Thủ Đức, <br>
						HCMC
					</p>
					<div class="space20">&nbsp;</div>
					<h5 class="contact-title">Hợp tác kinh doanh</h5>
					<p>
						Nếu bạn có nhã hứng muốn liên kết kinh doanh với shop, <br>
						thì hãy liên lạc qua mail này nha. <br>
						<a href="mailto:ybyf_hoptac@gmail.com">ybyf_hoptac@gmail.com</a>
					</p>
					<div class="space20">&nbsp;</div>
					<h5 class="contact-title">Xin việc</h5>
					<p>
						Nếu bạn nghĩ mình phù hợp với YBYF, <br>
						còn ngần ngại chi mà không mail ngay. <br>
						<a href="ybyf_nhansu@gmail.com">ybyf_nhansu@gmail.com</a>
					</p>
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection