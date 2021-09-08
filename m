Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86F4035F1
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 10:18:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 4376020847; Wed,  8 Sep 2021 08:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 08:18:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 660DC20846
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 08:00:59 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.528 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id GpeQkn8knZ70 for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 08:00:54 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 9DEA920845
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 08:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631088049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TB2ekSSIcbQoZxt/un7RjNKMTM5toctciF/7FP+Yn0s=;
	b=Ir8YH/L3jT8pNxhWaMMtMaED+Is7VTTPxI1+rtV+lL5mXykMJ/8PPQmYQLziBy/unoZVh1
	idKg54owtkvIv+x26maOg8ULRuzt8X+9ysouQunKRIf3GSDcwYUrLvXUgORZS0FyMsi78x
	LC+JFCanpKvZS0sgWj+d7ht1sIMllAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-psUk2-QYPEyMtlModTSVtg-1; Wed, 08 Sep 2021 04:00:48 -0400
X-MC-Unique: psUk2-QYPEyMtlModTSVtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F4D1501E8;
	Wed,  8 Sep 2021 08:00:47 +0000 (UTC)
Received: from T590 (ovpn-12-207.pek2.redhat.com [10.72.12.207])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED2B60BD8;
	Wed,  8 Sep 2021 08:00:40 +0000 (UTC)
Date: Wed, 8 Sep 2021 16:00:43 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YThtq154oyROxBj9@T590>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-3-yukuai3@huawei.com>
 <YThmhhI1/fZd29b1@T590>
 <e295605c-bc8e-cbb9-ca51-1355fdfc0264@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e295605c-bc8e-cbb9-ca51-1355fdfc0264@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <2X0ujXiydaK.A.jz.BHHOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1412
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YThtq154oyROxBj9@T590
Resent-Date: Wed,  8 Sep 2021 08:18:09 +0000 (UTC)

On Wed, Sep 08, 2021 at 03:37:06PM +0800, yukuai (C) wrote:
> On 2021/09/08 15:30, Ming Lei wrote:
> 
> > > +put_req:
> > > +	if (req)
> > > +		blk_mq_put_rq_ref(req);
> > >   	return ret ? ERR_PTR(ret) : cmd;
> > 
> > After the request's refcnt is dropped, it can be freed immediately, then
> > one stale command is returned to caller.
> 
> Hi, Ming
> 
> It's right this patch leave this problem. Please take a look at patch 3
> and patch 4, the problem should be fixed with these patches.

Not see it is addressed in patch 3 & 4, and it is one obvious fault in
patch 2, please fix it from beginning by moving the refcnt drop
into recv_work().

BTW, the approach in patch 3 looks fine, which is very similar with
SCSI's handling.

Thanks,
Ming

