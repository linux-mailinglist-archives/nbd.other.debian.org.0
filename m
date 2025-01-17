Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA42A14F0C
	for <lists+nbd@lfdr.de>; Fri, 17 Jan 2025 13:15:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id D7E1D20907; Fri, 17 Jan 2025 12:15:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Jan 17 12:15:10 2025
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 47D5920902
	for <lists-other-nbd@bendel.debian.org>; Fri, 17 Jan 2025 11:57:17 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.436 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
	RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
	RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 3Q759IuXHGfI for <lists-other-nbd@bendel.debian.org>;
	Fri, 17 Jan 2025 11:57:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by bendel.debian.org (Postfix) with ESMTP id D97FA20903
	for <nbd@other.debian.org>; Fri, 17 Jan 2025 11:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737115025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pQeV0O+jL1G/DFyqYGy9184NT6E7z1zePUvfpKkhxQI=;
	b=ZKdY4jtvWMN3MUhSBM45GYN3q0HIiLvq42cv2sVsOaruWoUdAIA2SsmE3y3wgDPl+XR+eI
	BQZuWC0l2wqn7jTJ3Ir01uGeV+zDxq70YPLGA3HWbV4wWtTyN40QJM+pUQpqGV+Yojnlgs
	OLFn6g3xMCGD8VWzt4NoS32pFvQpsr4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-X-QMKzuZMpylKLq_glYHgA-1; Fri,
 17 Jan 2025 06:57:02 -0500
X-MC-Unique: X-QMKzuZMpylKLq_glYHgA-1
X-Mimecast-MFC-AGG-ID: X-QMKzuZMpylKLq_glYHgA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7363919560BB;
	Fri, 17 Jan 2025 11:57:00 +0000 (UTC)
Received: from fedora (unknown [10.72.116.68])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9CA3F1955F10;
	Fri, 17 Jan 2025 11:56:53 +0000 (UTC)
Date: Fri, 17 Jan 2025 19:56:48 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	nbd@other.debian.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, linux-mtd@lists.infradead.org,
	linux-nvme@lists.infradead.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] loop: force GFP_NOIO for underlying file systems
 allocations
Message-ID: <Z4pFgIqB50gz-ODi@fedora>
References: <20250117074442.256705-1-hch@lst.de>
 <20250117074442.256705-2-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250117074442.256705-2-hch@lst.de>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <m8RuQQOtwlE.A.2NDL.OnkinB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3359
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Z4pFgIqB50gz-ODi@fedora
Resent-Date: Fri, 17 Jan 2025 12:15:10 +0000 (UTC)

On Fri, Jan 17, 2025 at 08:44:07AM +0100, Christoph Hellwig wrote:
> File systems can and often do allocate memory in the read-write path.
> If these allocations are done with __GFP_IO or __GFP_FS set they can
> recurse into the file system or swap device on top of the loop device
> and cause deadlocks.  Prevent this by forcing a noio scope over the
> calls into the file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 1ec7417c7f00..71eccc5cfffb 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1905,6 +1905,15 @@ static void loop_handle_cmd(struct loop_cmd *cmd)
>  	int ret = 0;
>  	struct mem_cgroup *old_memcg = NULL;
>  	const bool use_aio = cmd->use_aio;
> +	unsigned int memflags;
> +
> +	/*
> +	 * We're calling into file system which could do be doing memory
> +	 * allocations.  Ensure the memory reclaim does not cause I/O,
> +	 * because that could end up in the user of this loop devices again and
> +	 * deadlock.
> +	 */
> +	memflags = memalloc_noio_save();

If we call memalloc_noio_save() here, setting PF_MEMALLOC_NOIO can be removed
from loop_process_work().


Thanks,
Ming

