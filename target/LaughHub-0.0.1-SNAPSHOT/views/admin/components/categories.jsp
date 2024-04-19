<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang }" scope="request" />
<fmt:setBundle basename="category" scope="request" />

<div class="container-fluid pb-0 ">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-5">
				<div class="login-main border border-1  rounded mr-3 p-3 p-1">


					<form class="mx-1 mx-md-4" name="frmcategory" action=""
						method="post"
						ng-init="categoryEdit.id='${category.id }' ;categoryEdit.categoryName='${category.categoryName }';categoryEdit.description='${category.description }' ">

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="category.id_category" /></label> <input type="text" name="id"
									id="form3Example3c1" ng-model="categoryEdit.id"
									class="form-control" required /> <small
									ng-show="frmcategory.id.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="category.id_category" />
								</small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="category.category_name" /></label> <input type="text"
									name="categoryName" id="form3Example3c1"
									ng-model="categoryEdit.categoryName" class="form-control"
									required /> <small
									ng-show="frmcategory.categoryName.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="category.category_name" />
								</small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"> <fmt:message
										key="category.Category_description" />
								</label>
								<textarea name="description" id="form3Example3c1"
									ng-model="categoryEdit.description" class="form-control"
									required></textarea>
								<small ng-show="frmcategory.description.$error.required"
									class="form-text text-danger"> *<fmt:message
										key="category.Category_description" />
								</small>
							</div>
						</div>







						<div class="text-center m-1">
							<ul class="light-gray">
								<li><fmt:message key="category.note1" /></li>
								<li><fmt:message key="category.Attention1" /></li>
							</ul>
						</div>



						<div class="m-5">
							<div class="row g-1 mt-3">
								<div class="col-md-6">
									<button type="submit"
										class="btn btn-primary btn-lg rounded w-100" name="action"
										value="UpdateCategory" ng-disabled="frmcategory.$invalid">
										<span class="spinner-border d-none"></span> <fmt:message key="category.btn_Update" />
									</button>

								</div>

								<div class="col-md-6 ">

									<button type="submit"
										class="btn btn-lg btn-light rounded w-100" name="action"
										value="deleteCategory"
										ng-disabled=" frmcategory.id.$error.required">
										<span class="spinner-border d-none"></span> <fmt:message key="category.delete" />
									</button>

								</div>
							</div>

						</div>


					</form>


					<form class="mx-1 mx-md-4" name="categoryADD" action=""
						method="post"
						ng-init="categoryAdd.categoryName='${category.categoryName }';categoryAdd.description='${category.description }' ">



						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"> <fmt:message key="category.category_name" /></label> <input type="text" name="categoryName" id="form3Example3c1"
									ng-model="categoryAdd.categoryName" class="form-control"
									required /> <small
									ng-show="categoryADD.categoryName.$error.required"
									class="form-text text-danger"> * <fmt:message key="category.category_name" /> </small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message key="category.Category_description" /></label>
								<textarea name="description" id="form3Example3c1"
									ng-model="categoryAdd.description" class="form-control"
									required></textarea>
								<small ng-show="categoryADD.description.$error.required"
									class="form-text text-danger"> * <fmt:message key="category.Category_description" /> </small>
							</div>
						</div>







						<div class="text-center m-1">
							<ul class="light-gray">
								<li><fmt:message key="category.note2" /></li>
								<li><fmt:message key="category.Attention2" /></li>
							</ul>
						</div>



						<div class="m-5">
							<div class="row g-1 mt-3">
								<div class="col-md-12">
									<button type="submit"
										class="btn btn-primary btn-lg rounded w-100" name="action"
										value="AddCategory" ng-disabled="categoryADD.$invalid">
										<span class="spinner-border d-none"></span> <li><fmt:message key="category.add" /></li>
									</button>

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
							<i class="fas fa-fw fa-edit"></i> <i><li><fmt:message key="category.note_Left" /></li></i>
						</div>
						<div class="col d-flex justify-content-end">
							<strong> ${totalPages } <i class="fas fa-fw fa-bars"></i></strong>
						</div>
					</div>


					<table class="table align-middle mb-0 bg-white mt-2">
						<thead class="bg-light">
							<tr class="bg-info text-white ">
								<th><fmt:message key="category.id_category" /> *</th>
								<th><fmt:message key="category.category_name" /> </th>
								<th><fmt:message key="category.Category_description" /></th>
								<th><fmt:message key="category.create_at" /></th>
								<th><fmt:message key="category.Operation" /></th>

							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach items="${list}" var="category">



									<tr>
										<td>
											<div class="d-flex align-items-center">

												<div class="ms-3 px-2">

													<p class="fw-bold mb-1 ">
														<strong>${category.id}</strong>
													</p>

												</div>
											</div>
										</td>
										<td>
											<p class="fw-normal mb-1">${category.categoryName}</p>

										</td>
										<td><p class="fw-normal mb-1">${category.description}</p></td>
										<td><span
											class="badge badge-success rounded-pill d-inline">${category.createdDate}</span></td>
										<td>
											<button type="button" class="btn btn-link btn-sm btn-rounded">
												<a
													href="${pageContext.request.contextPath}/admin/categories/edit/${category.id}?page=${pageCount}&q=${q}"><i
													class="fas fa-fw fa-edit "></i> </a>
											</button>

											<button type="button" class="btn btn-link btn-sm btn-rounded">
												<a
													href="${pageContext.request.contextPath}/index?idCategory=${category.id}"><i
													class="fas fa-fw fa-share "></i> </a>
											</button>
										</td>
									</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list}">
								<tr>
									<td colspan="5">-- --</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<form action="" class="p-3 mt-2 border border-1 rounded">
						<div class="input-group">
							<input type="search" class="form-control rounded"
								placeholder="<fmt:message key="category.search" />" aria-label="Search"
								aria-describedby="search-addon" name="q" value="${q }" />
							<button type="submit"
								class="btn btn-outline-primary ml-2 rounded"
								data-mdb-ripple-init>
								<i class="fas fa-search"></i>
							</button>
						</div>
					</form>
				</div>

				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center pagination-sm mb-4">
						<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
							class="page-link" href="/LaughHub/admin/categories?page=0&q=${q}"
							tabindex="-1"><fmt:message key="category.First" /></a></li>

						<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/categories?page=${pageCount-1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-left"></i></a></li>


						<c:forEach var="i" begin="${pageCount >= 1 ? pageCount - 1 : 0}"
							end="${pageCount + 1}">
							<c:if test="${i >= 0 && i < Pages}">
								<li class="page-item ${i == pageCount ? 'active' : ''}"><a
									class="page-link"
									href="/LaughHub/admin/categories?page=${i}&q=${q}">${i + 1}</a>
								</li>
							</c:if>
						</c:forEach>

						<li
							class="page-item ${pageCount >= 0 && pageCount< Pages  ? '' : 'disabled'}"><a
							class="page-link"
							href="/LaughHub/admin/categories?page=${pageCount+1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-right"></i></a></li>


						<li
							class="page-item  ${pageCount == Pages-1 || pageCount ==0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/categories?page=${Pages-1}&q=${q}"
							tabindex="-1"><fmt:message key="category.Last" /></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>



</div>


