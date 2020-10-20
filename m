Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5AC29369B
	for <lists+nbd@lfdr.de>; Tue, 20 Oct 2020 10:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D3EE9205EB; Tue, 20 Oct 2020 08:16:50 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 20 08:16:50 2020
Old-Return-Path: <xiubli@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,LDOSUBSCRIBER,LDO_WHITELIST,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL autolearn=unavailable autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 50A8C205E8
	for <lists-other-nbd@bendel.debian.org>; Tue, 20 Oct 2020 08:16:43 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-7.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	LDO_WHITELIST=-5, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001]
	autolearn=ham autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id M3l8rt9Y-wI4 for <lists-other-nbd@bendel.debian.org>;
	Tue, 20 Oct 2020 08:16:40 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 8B623205DD
	for <nbd@other.debian.org>; Tue, 20 Oct 2020 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603181794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc; bh=iD5tQvHTqKLoAi7pndkIycrmVyIwHvsj4w4tynMZ8Rs=;
	b=G+Nk8IAHDxn1ipD3kj7saGmk8prLo198MylHO5YP48TJgJqOp5h+WnNcXgBvvaEy/6h+Gk
	uWB+/+2ZQZv86rEUpX1PO2gNz3hD0kYuCN4jSVE4Da5ktwkgPH6+A2116PV0irJccnY2kC
	S0ziRUReFZVcoGsiSc7GMQozTChzkb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-zmM6PZHUP924s6O97wiclg-1; Tue, 20 Oct 2020 04:16:30 -0400
X-MC-Unique: zmM6PZHUP924s6O97wiclg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E5C8EDBC0;
	Tue, 20 Oct 2020 08:16:28 +0000 (UTC)
Received: from lxbceph1.gsslab.pek2.redhat.com (vm37-120.gsslab.pek2.redhat.com [10.72.37.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 09F855D9D2;
	Tue, 20 Oct 2020 08:16:25 +0000 (UTC)
From: xiubli@redhat.com
To: josef@toxicpanda.com,
	axboe@kernel.dk
Cc: nbd@other.debian.org,
	linux-block@vger.kernel.org,
	jdillama@redhat.com,
	mgolub@suse.de,
	Xiubo Li <xiubli@redhat.com>
Subject: [PATCH 0/2] nbd: fix use-after-freed and double lock bugs
Date: Tue, 20 Oct 2020 04:16:13 -0400
Message-Id: <20201020081615.240305-1-xiubli@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <uYVSWqS9WnC.A.5lC.yzpjfB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1017
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/20201020081615.240305-1-xiubli@redhat.com
Resent-Date: Tue, 20 Oct 2020 08:16:50 +0000 (UTC)

From: Xiubo Li <xiubli@redhat.com>


Xiubo Li (2):
  nbd: fix use-after-freed crash for nbd->recv_workq
  nbd: fix double lock for nbd->config_lock

 drivers/block/nbd.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

-- 
2.18.4

