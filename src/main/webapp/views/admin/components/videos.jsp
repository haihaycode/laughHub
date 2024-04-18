<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang }" scope="request" />
<fmt:setBundle basename="video" scope="request" />

<div class="container-fluid pb-0 ">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-5">
				<div class="login-main border border-1  rounded mr-3 p-3 p-1">


					<form class="mx-1 mx-md-4" name="frmvideos" action="" method="post"
						enctype="multipart/form-data"
						ng-init="videoEdit.id='${video.id }';videoEdit.views='${video.views == null ? '0' : video.views }' ;videoEdit.title='${video.title }';videoEdit.description='${video.description }' ;videoEdit.videodate='${video.videodate }';videoEdit.poster='${video.poster }';videoEdit.active='${video.active }'">

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-video fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="video.ID_Youtube_Video" /></label> <input type="text" name="id"
									id="form3Example3c1" ng-model="videoEdit.id"
									style="color: #0a3d62; font-family: sans-serif; font-weight: bold;"
									class="form-control" required /> <small
									ng-show="frmvideos.id.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="video.ID_Youtube_Video" />
								</small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-file-signature fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="video.titleVideo" /></label> <input type="text" name="title"
									id="form3Example3c1" ng-model="videoEdit.title"
									class="form-control" required /> <small
									ng-show="frmvideos.title.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="video.titleVideo" />
								</small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-eye fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="video.view" /></label> <input name="views" type="text" min="0"
									disabled="disabled" id="form3Example3c1"
									ng-model="videoEdit.views" class="form-control" required>

							</div>
						</div>



						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-bars fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for=""><fmt:message
										key="video.category" /> </label> <select class="custom-select"
									name="videoCategoryId" id="categorySelect" required>

									<c:if test="${not empty categories}">
										<c:forEach items="${categories}" var="category">
											<option value="${category.id }"
												${video.videoCategory.id == category.id ? 'selected' :''}>${category.categoryName }</option>
										</c:forEach>
									</c:if>
									<c:if test="${empty categories}">
										<option value="0">-- 00000 --</option>
									</c:if>
								</select>


							</div>
						</div>






						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-file-signature fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="video.description" /> </label>
								<textarea name="description" id="form3Example3c1"
									ng-model="videoEdit.description" class="form-control" required></textarea>
								<small ng-show="frmvideos.description.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="video.description" />
								</small>
							</div>
						</div>

						<div
							class="d-flex flex-row align-items-center mb-4 justify-content-center ">

							<div class="form-check m-2">
								<input class="form-check-input" type="radio" name="active"
									value="true" id="flexRadioDefault1"
									${video.active ==true ? 'checked':'' }> <label
									class="form-check-label" for="flexRadioDefault1"> <fmt:message
										key="video.active" />
								</label>
							</div>
							<div class="form-check m-2">
								<input class="form-check-input" type="radio" name="active"
									value="false" id="flexRadioDefault2"
									${video.active ==false ? 'checked':'' }> <label
									class="form-check-label" for="flexRadioDefault2"> <fmt:message
										key="video.noactive" />
								</label>
							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-image fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="imageUpload"><fmt:message
										key="video.Upload_Photo" /></label> <input type="file"
									id="imageUpload" class="form-control" name="posterVideo"
									accept="image/*" onchange="previewImage(event)" />
							</div>
						</div>

						<div class="d-flex justify-content-center mb-4">
							<c:choose>
								<c:when test="${not empty video.poster}">
									<c:set var="avatarPath"
										value="/LaughHub/upload/client/poster/${video.poster}" />
								</c:when>
								<c:otherwise>
									<c:set var="avatarPath"
										value="https://cdn-icons-png.flaticon.com/512/6046/6046607.png" />
								</c:otherwise>
							</c:choose>
							<img id="imagePreview" class="img-thumbnail rounded  "
								alt="Preview Image" src="${ avatarPath}" />
						</div>





						<div class="text-center m-1">
							<ul class="light-gray">
								<li><fmt:message key="video.note" /></li>
								<li><fmt:message key="video.Attention" /></li>
							</ul>
						</div>



						<div class="m-5">
							<div class="row g-1 mt-3">
								<div class="col-md-6">
									<button type="submit"
										class="btn btn-primary btn-lg rounded w-100" name="action"
										value="CreateVideo" ng-disabled="frmvideos.$invalid">
										<span class="spinner-border d-none"></span> <fmt:message key="video.btnUploadVideo" />
									</button>

								</div>

								<div class="col-md-6 ">

									<button type="submit"
										class="btn btn-lg btn-light rounded w-100" name="action"
										value="DeleteVideo"
										ng-disabled=" frmvideos.id.$error.required">
										<span class="spinner-border d-none"></span> <fmt:message key="video.btnDeleteVideo" />
									</button>

								</div>

								<div class="col-md-6 mt-1">

									<button type="submit"
										class="btn btn-lg btn-primary rounded w-100" name="action"
										value="UpdateVideo" ng-disabled="frmvideos.$invalid">
										<span class="spinner-border d-none"></span>  <fmt:message key="video.btnUpdateVideo" />
									</button>

								</div>

								<div class="col-md-6 mt-1">

									<a href="${pageContext.request.contextPath}/admin/videos"
										class="btn btn-lg btn-primary rounded w-100"> <span
										class="spinner-border d-none"></span> <fmt:message key="video.btnReset" />
									</a>

								</div>
							</div>

						</div>


					</form>




					
				</div>
			</div>
			<div class="col-md-7">
				<div class="login-main-right border border-1 mb-3 p-3 rounded">


					<div class="row ">
						<div class="col">
							<i class="fas fa-fw fa-edit"></i>  <fmt:message key="video.Caution" /><i></i>
						</div>
						<div class="col d-flex justify-content-end">
							<strong> ${totalPages } <i class="fas fa-fw fa-video"></i></strong>
						</div>
					</div>


					<table class="table align-middle mb-0 bg-white mt-2">
						<thead class="bg-light">
							<tr class="bg-info text-white ">
								<th> <fmt:message key="video.ID_Youtube_Video" /> *</th>
								<th><fmt:message key="video.view" /></th>
								<th><fmt:message key="video.Create_at" /></th>
								<th><fmt:message key="video.status" /></th>
								<th><fmt:message key="video.Operation" /></th>

							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach items="${list}" var="video">


									<c:choose>
										<c:when test="${not empty video.poster}">
											<c:set var="avatarPath"
												value="/LaughHub/upload/client/poster/${video.poster}" />
										</c:when>
										<c:otherwise>
											<c:set var="avatarPath"
												value="https://cdn-icons-png.flaticon.com/512/6046/6046607.png" />
										</c:otherwise>
									</c:choose>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<img src="${avatarPath }" alt=""
													style="width: 45px; height: 45px" class="rounded-circle" />
												<div class="ms-3 px-2">
													<p class="fw-bold mb-1 ">
														( <i class="fas fa-fw fa-video"></i> <i><fmt:message key="video.ID_Youtube_Video" /> :
															${video.id}</i> ) <strong> <br> <fmt:message key="video.titleVideo" /> :
															${video.title}
														</strong>
													</p>
													<p class="text-muted mb-0"><fmt:message key="video.category" /> :
														${video.videoCategory.categoryName}</p>
												</div>
											</div>
										</td>
										<td>
											<p class="fw-normal mb-1">${video.views}<i
													class="fas fa-fw fa-eye"></i>
											</p>

										</td>
										<td><p class="fw-normal mb-1">${video.videodate}</p></td>
										<td><span
											class="badge badge-${video.active == true ? 'success' : 'light' } rounded-pill d-inline">${video.active == true ? '<i class="fas fa-check-circle"></i>' : '<i style="color : red" class="fas fa-times-circle"></i>' }</span></td>
										<td>
											<button type="button" class="btn btn-link btn-sm btn-rounded">
												<a
													href="${pageContext.request.contextPath}/admin/videos/edit/${video.id}?page=${pageCount}&q=${q}"><i
													class="fas fa-fw fa-edit "></i> </a>
											</button>
											<button type="button" class="btn btn-link btn-sm btn-rounded">
												<a
													href="${pageContext.request.contextPath}//watchVideo?v=${video.id}"><i
													class="fas fa-fw fa-share "></i> </a>
											</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5"> --- ---.</td>
								</tr>
							</c:if>
						</tbody>
					</table>

					<form action="" class="p-3 mt-2 border border-1 rounded">
						<div class="input-group">
							<!-- Tìm kiếm theo từ khóa -->
							<input type="search" class="form-control rounded"
								placeholder="<fmt:message key="video.search" />" aria-label="Search"
								aria-describedby="search-addon" name="q" value="${q}" />

							<!-- Dropdown chọn danh mục -->
							<select class="form-select rounded ml-2" name="idCategory">
								<option value="0"><fmt:message key="video.category" /></option>
								<c:if test="${not empty categories}">
									<c:forEach items="${categories}" var="category">
										<option value="${category.id }">${category.categoryName }</option>
									</c:forEach>
								</c:if>
								<c:if test="${empty categories}">
									<option value="0">-- 00 --</option>
								</c:if>


								<!-- Thêm các tùy chọn danh mục khác ở đây -->
							</select>

							<!-- Dropdown chọn trạng thái -->
							<select class="form-select rounded ml-2" name="active">
								<option value="0"><fmt:message key="video.status" /></option>
								<option value="1"><fmt:message key="video.active" /></option>
								<option value="2"><fmt:message key="video.noactive" /></option>
							</select>

							<!-- Nút tìm kiếm -->
							<button type="submit"
								class="btn btn-outline-primary ml-2 rounded"
								data-mdb-ripple-init>
								<i class="fas fa-search"></i><fmt:message key="video.btnSearch" />
							</button>
						</div>
					</form>

				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm mb-4">
						<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
							class="page-link" href="/LaughHub/admin/videos?page=0&q=${q}"
							tabindex="-1"><fmt:message key="video.First" /></a></li>

						<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/videos?page=${pageCount-1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-left"></i></a></li>


						<c:forEach var="i" begin="${pageCount >= 1 ? pageCount - 1 : 0}"
							end="${pageCount + 1}">
							<c:if test="${i >= 0 && i < Pages}">
								<li class="page-item ${i == pageCount ? 'active' : ''}"><a
									class="page-link"
									href="/LaughHub/admin/videos?page=${i}&q=${q}">${i + 1}</a></li>
							</c:if>
						</c:forEach>

						<li
							class="page-item ${pageCount >= 0 && pageCount< Pages  ? '' : 'disabled'}"><a
							class="page-link"
							href="/LaughHub/admin/videos?page=${pageCount+1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-right"></i></a></li>


						<li
							class="page-item  ${pageCount == Pages-1 || pageCount ==0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/videos?page=${Pages-1}&q=${q}"
							tabindex="-1"><fmt:message key="video.Last" /></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>



</div>


<script type="text/javascript">
	function previewImage(event) {
		var input = event.target;
		var reader = new FileReader();

		reader.onload = function() {
			var img = document.getElementById('imagePreview');
			img.src = reader.result;
			img.classList.remove('d-none'); // Hiển thị ảnh khi đã chọn
		};

		reader.readAsDataURL(input.files[0]);
	}
</script>

