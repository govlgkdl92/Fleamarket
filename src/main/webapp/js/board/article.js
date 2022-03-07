let writer;//글쓴 사람

$(document).ready(function(){
	var comment_writer; //댓글 쓴 사람
	$('#commentListTable tr:eq(0)').remove();
	$('#commentListTable tr:gt(0)').remove();
	
	
	//글 화면 출력
	$.ajax({
		type : 'post',
		url : '/market/board/getArticle',
		data : 'seq='+$('#seq').val(), 
		dataType : 'json', //sessionId, boardDTO
		success : function(data){
			$('#board_subject').text(data.boardDTO.board_subject);
			$('#mem_id').text(data.boardDTO.mem_id);
			$('#board_logtime').text(data.boardDTO.board_logtime);
			$('#board_hit').text(data.boardDTO.board_hit);
			$('#board_content').text(data.boardDTO.board_content);
			writer=data.boardDTO.mem_id;//글쓴 사람
			
			
			//작성자 본인일 경우 : 신고버튼X. OWNER쪽 O
			if(data.sessionId == data.boardDTO.mem_id){
				$('#owner').show();	
				$('.singoBtn').hide();	
			//작성자 아닐 경우 : 신고버튼O. OWNER쪽 X
			}else {
				$('.singoBtn').show();	
				$('#owner').hide();	
			}
		},error: function(err){
			console.log(err);
		}
	});
	
	//댓글 출력
	$('#triggerList').change(function(){
		$.ajax({
			type : 'post',
			url : '/market/board/showComment',
			data : 'board_seq='+$('#board_seq').val(), 
			dataType : 'json',
			success: function(data){
				$.each(data.list, function(index, items){
					$('<tr/>',{
			        	class: 'commentArea'+items.comment_seq
			        }).append($('<td/>',{
			            align: 'center',
			            text: items.mem_id,
			            width: 300
			        })).append($('<td/>',{
			            text: items.comment_content,
			            width: 900,
			        })).append($('<td/>',{
			            align: 'center',
			            text: items.comment_logtime,
			            height: 70,
			            width: 110
			        })).append($('<td/>',{
			            width: 100,
			            align: 'right',
			            }).append($('<a/>',{
			                href: 'javascript:;',
			                id:'moreBtn'+items.comment_seq
			                }).append($('<img/>',{
			                    src: '../image/board/moreBtn.png',
			                    viewBox:"0 0 3 15"
			                }))
			            ).append($('<div/>',{//더보기 클릭시 나오는 곳
			                id:'writerVersion',//내가 댓글 작성자일때, 
			                class:'writerVersion'+items.comment_seq,
			                }).append($('<a/>',{
			                    text: '수정  |  ',
			                    href: 'javascript:;',
			                    id:'modifyCommentBtn'+items.comment_seq
			                })).append($('<a/>',{
			                    text: '삭제',
			                    href: 'javascript:;',
			                    id:'deleteCommentBtn'+items.comment_seq
			                }))
			            ).append($('<div/>',{//내가 댓글 작성자가 아닐때
			                id:'notWriterVersion',
			                class:'notWriterVersion'+items.comment_seq,
			            }).append($('<a/>',{
			                text: '신고',
			                href: 'javascript:;',
			                id:'singoBtn'+items.comment_seq
			            })))).appendTo($('#commentListTable'));
			        
			        $('.writerVersion'+items.comment_seq).hide();
					$('.notWriterVersion'+items.comment_seq).hide();
					console.log($('#comment_seq').val());
				});//each
			},error: function(err){
				console.log(err)
			}
		});	
	});//트리거!!!!!!
	
	$('#triggerList').trigger('change');//댓글 출력
	

	
	//더보기 버튼 이후
	$.ajax({
		type : 'post',
		url : '/market/board/showComment',
		data : 'board_seq='+$('#board_seq').val(), 
		dataType : 'json',
		success: function(data){
			
			$.each(data.list, function(index, items){
				//더보기 버튼 클릭
				$('#commentListTable').on('click', '#moreBtn'+items.comment_seq, function(){
					if ($('#sessionId').val()=='' || $('#sessionId').val()=='none'){//세션 만료로 인해 로그아웃 시, 
						location.href='/market/member/loginForm';//로그인 페이지로 이동
					}
					//댓글쓴이와 세션아이디가 같다면(==내가 댓글 쓴 사람이라면), 수정/삭제버튼
					if($('#sessionId').val() == items.mem_id){//items.mem_id=댓글쓴이
						console.log("세션아이디:"+$('#sessionId').val());
						console.log("댓글쓴이:"+items.mem_id);
						console.log("writerVersion"+items.comment_seq);
						$('.writerVersion'+items.comment_seq).show();
						$('.notWriterVersion'+items.comment_seq).hide();
						
						//댓글 삭제
						$('#commentListTable').on('click', '#deleteCommentBtn'+items.comment_seq, function(){
							$.ajax({
								type : 'post',
								url : '/market/board/deleteComment',
								data : 'comment_seq='+items.comment_seq, //삭제할 댓글 번호
								success: function(){
									alert("성공적으로 삭제했습니다.");
									$('#commentListTable tr:gt(0)').remove(); //gt(0) -> eq(0) 순으로!
									$('#commentListTable tr:eq(0)').remove();
									$('#triggerList').trigger('change');
								},error: function(err){
									console.log(err);
								}
							});
						});//-end 댓글삭제
						
						//댓글 수정
						$('#commentListTable').on('click', '#modifyCommentBtn'+items.comment_seq, function(){
							//수정 창으로 변환
							$('#commentListTable .commentArea'+items.comment_seq).attr('class', 'commentModifyArea'+items.comment_seq);
							$('.commentModifyArea'+items.comment_seq).html(
								"<td style='width:800px' colspan='3'><textarea class='textarea_input' id='modifyContent'></textarea></td><td><input type='button' id='sendModifyBtn' value='수정'></td>");
//							$(!'#commentListTable .commentModifyArea'+items.comment_seq).attr('class', 'commentArea'+items.comment_seq);
							
							//기존 댓글 불러오기
							$.ajax({
								type : 'post',
								url : '/market/board/getAComment',
								data : 'comment_seq='+items.comment_seq,
								dataType:'text',
								success: function(data){//data=comment content(댓글 내용)
									$('#commentListTable #modifyContent').val(data);
								},error: function(err){
									console.log(err);
								}
							});
							//수정 update
							$('#sendModifyBtn').click(function(){
								$.ajax({
									type : 'post',
									url : '/market/board/modifyComment',
									data : 'comment_seq='+items.comment_seq+"&comment_content="+$('#modifyContent').val(),
									success: function(data){
										$('#commentListTable tr:gt(0)').remove();
										$('#commentListTable tr:eq(0)').remove();
										
										$('#triggerList').trigger('change');
									},error: function(err){
										console.log(err);
									}
								});
							});
						});//end 댓글 수정
					}//if
					//작성자가 다르다면, 신고버튼
					else{
						console.log("세션아이디:"+$('#sessionId').val());
						console.log("댓글쓴이:"+items.mem_id);
						console.log("notWriterVersion"+$('#comment_seq').val());
						$('.notWriterVersion'+items.comment_seq).show();
						$('.writerVersion'+items.comment_seq).hide();
						
						//댓글 신고
						$('#commentListTable').on('click', '#singoBtn'+items.comment_seq, function(){
							//★여기서부터 trigger되어야★★★★★
							$("#modalHidden").attr('id','modalDisplay'); //신고 모달창이 뜬다.
							
							$('.contentList>button').mouseenter(function(){
								 $(this).css('text-decoration', 'underline');
								 $(this).mouseleave(function(){
							        $(this).css('text-decoration', 'none');
								 });
								 
//								 신고접수
								 $(this).off('click').on('click',function(){
									if($('#sessionId').val()==null){ //세션 만료로 인해 로그인 풀렸을때
										location.href="/market/member/loginForm";
									}else{
										$.ajax({
											type : 'post',
											url : '/market/member/complain',
											data: {reporter_id: $('#sessionId').val(),
													complain_content : $(this).text(),
													comment_seq : items.comment_seq, //댓글 seq
													complain_category : '댓글 신고',
													mem_id: items.mem_id //댓글쓴 사람(==신고당할 사람)
											},success: function(){
												alert("신고가 성공적으로 접수되었습니다.")
											},error: function(err){
												console.log(err)
											}
										});//ajax
									}//else
									
								 });//click
							});//mouseenter
							
							//기타 사유 서술했을 때(this.text()대신에 직접쓴 내용이 content로 전달되어야 한다)
						   $('#complainReasonBtn').click(function(){
							   $.ajax({
									type : 'post',
									url : '/market/member/complain',
									data: {reporter_id: $('#sessionId').val(),
											complain_content : $('#complainReason').val(),
											comment_seq : items.comment_seq,
											complain_category : '댓글 신고',
											mem_id:items.mem_id //댓글쓴 사람(==신고당할 사람)
									},success: function(){
										alert("신고가 성공적으로 접수되었습니다.")
									},error: function(err){
										console.log(err)
									}
								});//ajax
						   });
							
						   // 신고 카테고리 펼치기
							 $('#singoModalBottom').on("click", '.singoTitle > .titleBtn', function(){
							     $(this).parent().attr('class','singoTitleOpen'); //$(this).parent() == $(".singoTitle")
							      
							     var className = $(this).parent().next().attr('class');
							     // height=180;인 애만 따로 처리
							     if(className == 'singoContentOther'){
							    	 $(this).parent().next().attr('class','singoContentOtherOpen');
							     }else if(className == 'singoContent') {
							    	 $(this).parent().next().attr('class','singoContentOpen'); 
							     }
							      
							      // 닫기 
							     $('#singoModalBottom').on("click", '.singoTitleOpen > .titleBtn', function(){
							         $(this).parent().attr('class','singoTitle');
							         
							         if(className == 'singoContentOtherOpen' || className =='singoContentOther'){
							            $(this).parent().next().attr('class', 'singoContentOther');
							         }else if(className == 'singoContentOpen' || className=='singoContent'){
							            $(this).parent().next().attr('class', 'singoContent');            
							         }
							     });//(2)닫기
							 });//신고 카테고리 펼치기
							   
							   // 모달 창 닫기 modalCloseBtn
							   $('.singoModalWrap').on("click", '.modalCloseBtn', function(){
							      var openInBtn = $('.singoTitleOpen>button');
							      var className = openInBtn.parent().next().attr('class'); //위의 className과 관련없음
							      
							      $(openInBtn).parent().attr('class','singoTitle');
							      
							      if(className == 'singoContentOtherOpen' || className =='singoContentOther'){
							         $(openInBtn).parent().next().attr('class', 'singoContentOther');
							      }else if(className == 'singoContentOpen' || className=='singoContent'){
							         $(openInBtn).parent().next().attr('class', 'singoContent');            
							      }
							      $("#modalDisplay").attr('id','modalHidden'); 
							   });
							   
							   
							 //글자수 카운팅
								$('#complainReason').keyup(function(){
									let content = $(this).val();
									$('#counter').html(content.length);
									
									if(content.length>200){
										$('#textCounterDiv').text("입력 가능한 글자 수를 초과했습니다.");
										$(this).val(content.substring(0, 200)); //글자수 초과하면 안써지게
									}
								});
								//★여기서까지 trigger끝★★★★★
							});//신고끝
						}//else
					});
				});
			
			}//success
			,error: function(err){
				console.log(err);
			}
	});//end더보기버
		
	//댓글쓰기
	$('.textarea_input').on('click', '#commentBtn', function(){
//	$('#commentBtn').click(function(){
		if ($('#comment_content').val()==''){
			$('#commentAreaDiv').text("댓글을 입력하세요");
		}
		//세션만료로 인해 로그아웃되었을때
		else if ($('#sessionId').val()=='' || $('#sessionId').val()=='none'){
			location.href='/market/member/loginForm';
		}else{
			$.ajax({
				type : 'post',
				url : '/market/board/writeComment',
				data: {'comment_content': $('#comment_content').val(),
					'board_seq': $('#board_seq').val()
				},success: function(){
					$('#commentListTable tr:gt(0)').remove();
					$('#commentListTable tr:eq(0)').remove();
					$('#triggerList').trigger('change');
					$('#comment_content').val('');
				},error: function(err){
					console.log(err)
				}
			});
		}
	});//-end 댓글쓰기
	
//===================================================================================
		//글 수정하기
		$('#articleModifyBtn').click(function(){
			document.article.method="post"
			document.article.action="../board/modifyArticleForm";
			document.article.submit();
			
		});//--end글 수정
		
		//글 삭제하기
		$('#articleDeleteBtn').click(function(){
			$.ajax({
				type : 'post',
				url : '/market/board/deleteArticle',
				data: 'seq='+$('#seq').val(),
				success: function(){
					if(confirm("정말 삭제하시겠습니까?")){
						("작성하신 글이 성공적으로 삭제되었습니다.");
						location.href="/market/board/list";	
					}
				},error: function(err){
					console.log(err)
				}
			});
		});//--end글 삭제
	
		//답글쓰기
		$('#replyBtn').click(function(){
			if ($('#sessionId').val()=='' || $('#sessionId').val()=='none'){
				location.href='/market/member/loginForm';
			}else{
				document.article.method="post";
				document.article.action="../board/replyForm";//controller
				document.article.submit();
			}
			
		});//--end 답글쓰기
	
		//글 신고하기
		$('.section2-5-1').on('click', '.singoBtn', function(){
			$("#modalHidden").attr('id','modalDisplay'); //신고 모달창이 뜬다.
			
			$('.contentList>button').mouseenter(function(){
				 $(this).css('text-decoration', 'underline');
				 $(this).mouseleave(function(){
			        $(this).css('text-decoration', 'none');
				 });
				 
				 $(this).off('click').on('click',function(){
					if($('#sessionId').val()==null){ //세션 만료로 인해 로그인 풀렸을때
						location.href="/market/member/loginForm";
					}else{
						$.ajax({
							type : 'post',
							url : '/market/member/complain',
							data: {reporter_id: $('#sessionId').val(),
									complain_content : $(this).text(),
									board_seq : $('#board_seq').val(),
									mem_id: writer, //글쓴 사람
									complain_category : '게시글 신고'
							},success: function(){
								alert("신고가 성공적으로 접수되었습니다.")
							},error: function(err){
								console.log(err)
							}
						});//ajax
					}
					
				 });//click
			});//mouseenter
			
			//기타 사유 서술했을 때
			$('#complainReasonBtn').click(function(){
			   $.ajax({
					type : 'post',
					url : '/market/member/complain',
					data: {reporter_id: $('#sessionId').val(),
							complain_content : $('#complainReason').val(),
							board_seq : $('#board_seq').val(),
							complain_category : '게시글 신고', 
							mem_id: writer,
					},success: function(){
						alert("신고가 성공적으로 접수되었습니다.")
					},error: function(err){
						console.log(err)
					}
				});//ajax
			});
			 
			
		   // 신고 카테고리 펼치기
			 $('#singoModalBottom').on("click", '.singoTitle > .titleBtn', function(){
			     $(this).parent().attr('class','singoTitleOpen'); //$(this).parent() == $(".singoTitle")
			      
			     var className = $(this).parent().next().attr('class');
			     // height=180;인 애만 따로 처리
			     if(className == 'singoContentOther'){
			    	 $(this).parent().next().attr('class','singoContentOtherOpen');
			     }else if(className == 'singoContent') {
			    	 $(this).parent().next().attr('class','singoContentOpen'); 
			     }
			      
			      // 닫기 (다시 클릭)
			     $('#singoModalBottom').on("click", '.singoTitleOpen > .titleBtn', function(){
			         $(this).parent().attr('class','singoTitle');
			         
			         if(className == 'singoContentOtherOpen' || className =='singoContentOther'){
			            $(this).parent().next().attr('class', 'singoContentOther');
			         }else if(className == 'singoContentOpen' || className=='singoContent'){
			            $(this).parent().next().attr('class', 'singoContent');            
			         }
			     });//(2)닫기
			 });//신고 카테고리 펼치기
			   
			   // 모달 창 닫기 modalCloseBtn
			   $('.singoModalWrap').on("click", '.modalCloseBtn', function(){
			      var openInBtn = $('.singoTitleOpen>button');
			      var className = openInBtn.parent().next().attr('class'); //위의 className과 관련없음
			      
			      $(openInBtn).parent().attr('class','singoTitle');
			      
			      if(className == 'singoContentOtherOpen' || className =='singoContentOther'){
			         $(openInBtn).parent().next().attr('class', 'singoContentOther');
			      }else if(className == 'singoContentOpen' || className=='singoContent'){
			         $(openInBtn).parent().next().attr('class', 'singoContent');            
			      }
			      $("#modalDisplay").attr('id','modalHidden'); 
			   });
			   
			   
			 //글자수 카운팅
				$('#complainReason').keyup(function(){
					let content = $(this).val();
					$('#counter').html(content.length);
					
					if(content.length>200){
						$('#textCounterDiv').text("입력 가능한 글자 수를 초과했습니다.");
						$(this).val(content.substring(0, 200)); //글자수 초과하면 안써지게
					}
				});
			
		});//--end 글 신고하기
			
});

