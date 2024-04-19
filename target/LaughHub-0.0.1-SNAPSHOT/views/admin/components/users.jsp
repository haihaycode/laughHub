<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.lang }" scope="request" />
<fmt:setBundle basename="user" scope="request" />

<div class="container-fluid pb-0 ">
	<div class="container pl-0 pr-0 ">
		<div class="row no-gutters">
			<div class="col-md-5">
				<div class="login-main border border-1  rounded mr-3 p-3 p-1">


					<form class="mx-1 mx-md-4" name="frmRegister" action=""
						method="post"
						ng-init="studentR.id='${userEdit.id }' ;studentR.email='${userEdit.email }';studentR.fullname='${userEdit.fullname }' ;studentR.password='${userEdit.password }'">
						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-user fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c1"><fmt:message
										key="user.account" /></label> <input type="text" name="id"
									id="form3Example3c1" ng-model="studentR.id"
									class="form-control" required minlength="6" /> <small
									ng-show="frmRegister.id.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="user.account" />
								</small> <small ng-show="frmRegister.id.$error.minlength"
									class="form-text text-danger"> *<fmt:message
										key="user.invalid" /> >= 6
								</small>

							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-signature fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example3c2"><fmt:message
										key="user.fullname" /></label> <input type="text" name="fullname"
									id="form3Example3c2" ng-model="studentR.fullname"
									class="form-control" required minlength="6" /> <small
									ng-show="frmRegister.fullname.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="user.fullname" /></small> <small
									ng-show="frmRegister.fullname.$error.minlength"
									class="form-text text-danger"> *<fmt:message
										key="user.invalid" /> >=5
								</small>
							</div>
						</div>

						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-lock fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" name="password" for="form3Example4c3"><fmt:message
										key="user.pass" /></label> <input type="password"
									id="form3Example4c3" ng-model="studentR.password"
									name="password" class="form-control" required minlength="6" />
								<small ng-show="frmRegister.password.$error.required"
									id="password" class="form-text text-danger"> * <fmt:message
										key="user.pass" /></small> <small
									ng-show="frmRegister.password.$error.minlength" id="password"
									class="form-text text-danger"> *<fmt:message
										key="user.invalid" /> (>=6)*
								</small>
							</div>
						</div>



						<div class="d-flex flex-row align-items-center mb-4">
							<i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
							<div class="form-outline flex-fill mb-0">
								<label class="form-label" for="form3Example4c5"><fmt:message
										key="user.email" /></label> <input type="email" id="form3Example4c5"
									class="form-control" ng-model="studentR.email" name="email"
									required /> <small ng-show="frmRegister.email.$error.required"
									class="form-text text-danger"> * <fmt:message
										key="user.pass" /></small> <small
									ng-show="frmRegister.email.$error.email"
									class="form-text text-danger"> *<fmt:message
										key="user.invalid" /></small>
							</div>
						</div>

						<div class="m-5">
							<div class="row g-1 mt-3">
								<div class="col-md-6">
									<button type="submit"
										class="btn btn-primary btn-lg rounded w-100" name="action"
										value="LoginUser"
										ng-disabled="frmRegister.id.$error.minlength || frmRegister.id.$error.required">
										<span class="spinner-border d-none"></span>
										<fmt:message key="user.btn_login" />
									</button>

								</div>
								<div class="col-md-6 ">
									<button type="submit"
										class="btn btn-primary btn-lg rounded  w-100" name="action"
										value="updateUser" ng-disabled="frmRegister.$invalid">
										<span class="spinner-border d-none"></span>
										<fmt:message key="user.btn_update" />
									</button>
								</div>
								<div class="col-md-6 ">

									<button type="submit"
										class="btn btn-lg btn-light rounded w-100" name="action"
										value="deleteUser"
										ng-disabled="frmRegister.id.$error.minlength || frmRegister.id.$error.required">
										<span class="spinner-border d-none"></span>
										<fmt:message key="user.btn_delete_acount" />
									</button>

								</div>
							</div>

						</div>


					</form>
					<div class="text-center m-1">
						<ul class="light-gray">
							<li><fmt:message key="user.note" /></li>
							<li><fmt:message key="user.Attention" /></li>

						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-7">
				<div class="login-main-right border border-1 mb-3 p-3 rounded">


					<div class="row ">
						<div class="col">
							<i class="fas fa-fw fa-edit"></i>
							<fmt:message key="user.note_Left" />
							<i></i>
						</div>
						<div class="col d-flex justify-content-end">
							<strong> ${totalPages } <i class="fas fa-fw fa-users"></i></strong>
						</div>
					</div>

					<table class="table align-middle mb-0 bg-white mt-2">
						<thead class="bg-light">
							<tr class="bg-info text-white ">
								<th><fmt:message key="user.account" /></th>
								<th><fmt:message key="user.pass" /></th>
								<th><fmt:message key="user.fullname" /></th>
								<th><fmt:message key="user.role" /></th>
								<th><fmt:message key="user.Operation" /></th>

							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list}">
								<c:forEach items="${list}" var="user">


									<c:choose>
										<c:when test="${not empty user.avatar}">
											<c:set var="avatarPath"
												value="/LaughHub/upload/client/image/${user.avatar}" />
										</c:when>
										<c:otherwise>
											<c:set var="avatarPath"
												value="https://uploads.nhanhoa.com/news/no-avatar.png" />
										</c:otherwise>
									</c:choose>
									<tr>
										<td>
											<div class="d-flex align-items-center">
												<img src="${avatarPath }" alt=""
													style="width: 45px; height: 45px" class="rounded-circle" />
												<div class="ms-3 px-2">
													<p class="fw-bold mb-1 ">
														<strong>${user.id}</strong>
													</p>
													<p class="text-muted mb-0">${user.email}</p>
												</div>
											</div>
										</td>
										<td>
											<p class="fw-normal mb-1">${user.password}</p>

										</td>
										<td><p class="fw-normal mb-1">${user.fullname}</p></td>
										<td><span
											class="badge badge-${user.admin == true ? 'primary' : 'success' } rounded-pill d-inline">

												<c:if test="${user.admin}">
													<fmt:message key="user.manage" />
												</c:if> <c:if test="${!user.admin}">
													<fmt:message key="user.employer" />
												</c:if>

										</span></td>
										<td>
											<button type="button" class="btn btn-link btn-sm btn-rounded">
												<a
													href="${pageContext.request.contextPath}/admin/users/edit/${user.id}?page=${pageCount}&q=${q}"><i
													class="fas fa-fw fa-edit "></i> </a>
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
								placeholder="<fmt:message key="user.Search_user" />" aria-label="Search"
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
							class="page-link" href="/LaughHub/admin/users?page=0&q=${q}"
							tabindex="-1"><fmt:message key="user.First" /></a></li>

						<li class="page-item ${pageCount == 0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/users?page=${pageCount-1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-left"></i></a></li>


						<c:forEach var="i" begin="${pageCount >= 1 ? pageCount - 1 : 0}"
							end="${pageCount + 1}">
							<c:if test="${i >= 0 && i < Pages}">
								<li class="page-item ${i == pageCount ? 'active' : ''}"><a
									class="page-link" href="/LaughHub/admin/users?page=${i}&q=${q}">${i + 1}</a>
								</li>
							</c:if>
						</c:forEach>

						<li
							class="page-item ${pageCount >= 0 && pageCount< Pages  ? '' : 'disabled'}"><a
							class="page-link"
							href="/LaughHub/admin/users?page=${pageCount+1}&q=${q}"
							tabindex="-1"><i class="fas fa-angle-right"></i></a></li>


						<li
							class="page-item  ${pageCount == Pages-1 || pageCount ==0 ? 'disabled' : ''}"><a
							class="page-link"
							href="/LaughHub/admin/users?page=${Pages-1}&q=${q}" tabindex="-1"><fmt:message key="user.Last" /></a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>



</div>


