Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 42988A058D2
	for <lists+nbd@lfdr.de>; Wed,  8 Jan 2025 11:57:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2355F20784; Wed,  8 Jan 2025 10:57:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Jan  8 10:57:10 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 9293F2067D
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Jan 2025 10:39:44 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.538 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id d9P8t_7Ryd_I for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Jan 2025 10:39:39 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id 90825206F6
	for <nbd@other.debian.org>; Wed,  8 Jan 2025 10:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736332774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=C5e7qX6c+UMsIuToE357cYeqwuSYtBePWh3qPklcP7I=;
	b=K1tLqrflbl6xE66S+RksN3fxsoN6X47t9RZBR6x2upXWnSK+Qxaysi2lPrHE8oAtNm1g5D
	iVAa3nYMM9ndXLt49lysTjMNl1bAXRQUTNsp0zHJMTquhha6RSEf+a66OADpRrIEwliLTg
	gSZqBO+VqE54fp7tedWThmYeIy9Pxlc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-L_aTQMnBM0So-ZDJs6AXYw-1; Wed,
 08 Jan 2025 05:39:32 -0500
X-MC-Unique: L_aTQMnBM0So-ZDJs6AXYw-1
X-Mimecast-MFC-AGG-ID: L_aTQMnBM0So-ZDJs6AXYw
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BB66919153C8;
	Wed,  8 Jan 2025 10:39:30 +0000 (UTC)
Received: from fedora (unknown [10.72.116.74])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF54519560AA;
	Wed,  8 Jan 2025 10:39:24 +0000 (UTC)
Date: Wed, 8 Jan 2025 18:39:19 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>, linux-block@vger.kernel.org,
	linux-nvme@lists.infradead.org, nbd@other.debian.org,
	linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH 06/10] nvme: fix queue freeze vs limits lock order
Message-ID: <Z35V11UDYRCHgJgI@fedora>
References: <20250108092520.1325324-1-hch@lst.de>
 <20250108092520.1325324-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108092520.1325324-7-hch@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <YV460LVfm2B.A.zE5O.GolfnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3290
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z35V11UDYRCHgJgI@fedora
Resent-Date: Wed,  8 Jan 2025 10:57:10 +0000 (UTC)

On Wed, Jan 08, 2025 at 10:25:03AM +0100, Christoph Hellwig wrote:
> Match the locking order used by the core block code by only freezing
> the queue after taking the limits lock.
> 
> Unlike most queue updates this does not use the
> queue_limits_commit_update_frozen helper as the nvme driver want the
> queue frozen for more than just the limits update.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
> Reviewed-by: Nilay Shroff <nilay@linux.ibm.com>
 
Reviewed-by: Ming Lei <ming.lei@redhat.com> 

Thanks, 
Ming

