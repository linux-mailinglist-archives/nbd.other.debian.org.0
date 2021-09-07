Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4EF4021DA
	for <lists+nbd@lfdr.de>; Tue,  7 Sep 2021 03:54:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 3344820B37; Tue,  7 Sep 2021 01:54:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Sep  7 01:54:21 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: **
X-Spam-Status: No, score=2.7 required=4.0 tests=CC_TOO_MANY,DIGITS_LETTERS,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FOURLA,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 19D5720C11
	for <lists-other-nbd@bendel.debian.org>; Tue,  7 Sep 2021 01:37:41 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=0.472 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DIGITS_LETTERS=1,
	DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QrQARQ3myeBP for <lists-other-nbd@bendel.debian.org>;
	Tue,  7 Sep 2021 01:37:38 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 586EC20BF2
	for <nbd@other.debian.org>; Tue,  7 Sep 2021 01:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630978653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LD4HmvA+6ng2SFaOBQkrpmMcYGijXFYTWjOibY469rU=;
	b=GRrcgupssVywBzH5KljwoqxgVpkvxMg0ydRW5LvLE/qeyWB8zj9HhFmsRbiK8CsFCTCWjI
	II4nAhmIPfcIbqEbbncVR8od40OvN94r8u7eHPRme6OMvD3E+QxDyp/9d2eM/v1XwId4YB
	BS0KdBzsR9yuf1DI0ui2oaB6/LJj46M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-jemrBUYpPzmuqg88LXk5sw-1; Mon, 06 Sep 2021 21:37:30 -0400
X-MC-Unique: jemrBUYpPzmuqg88LXk5sw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFBFF10054F6;
	Tue,  7 Sep 2021 01:37:27 +0000 (UTC)
Received: from T590 (ovpn-8-23.pek2.redhat.com [10.72.8.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8619927097;
	Tue,  7 Sep 2021 01:37:04 +0000 (UTC)
Date: Tue, 7 Sep 2021 09:37:05 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: axboe@kernel.dk, martin.petersen@oracle.com, jejb@linux.ibm.com,
	kbusch@kernel.org, sagi@grimberg.me, adrian.hunter@intel.com,
	beanhuo@micron.com, ulf.hansson@linaro.org, avri.altman@wdc.com,
	swboyd@chromium.org, agk@redhat.com, snitzer@redhat.com,
	josef@toxicpanda.com, hch@infradead.org, hare@suse.de,
	bvanassche@acm.org, linux-scsi@vger.kernel.org,
	linux-nvme@lists.infradead.org, linux-mmc@vger.kernel.org,
	dm-devel@redhat.com, nbd@other.debian.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 2/8] scsi/sr: add error handling support for add_disk()
Message-ID: <YTbCQdieHG07Bz8W@T590>
References: <20210830212538.148729-1-mcgrof@kernel.org>
 <20210830212538.148729-3-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830212538.148729-3-mcgrof@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <-20tEmMCg_H.A.ZK.NZsNhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1397
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTbCQdieHG07Bz8W@T590
Resent-Date: Tue,  7 Sep 2021 01:54:21 +0000 (UTC)

On Mon, Aug 30, 2021 at 02:25:32PM -0700, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
>  drivers/scsi/sr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/scsi/sr.c b/drivers/scsi/sr.c
> index 2942a4ec9bdd..72fd21844367 100644
> --- a/drivers/scsi/sr.c
> +++ b/drivers/scsi/sr.c
> @@ -779,7 +779,10 @@ static int sr_probe(struct device *dev)
>  	dev_set_drvdata(dev, cd);
>  	disk->flags |= GENHD_FL_REMOVABLE;
>  	sr_revalidate_disk(cd);
> -	device_add_disk(&sdev->sdev_gendev, disk, NULL);
> +
> +	error = device_add_disk(&sdev->sdev_gendev, disk, NULL);
> +	if (error)
> +		goto fail_minor;

You don't undo register_cdrom(), maybe you can use kref_put(&cd->kref, sr_kref_release);
to simplify the error handling.


Thanks,
Ming

