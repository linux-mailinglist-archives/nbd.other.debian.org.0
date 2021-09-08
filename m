Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBAF403738
	for <lists+nbd@lfdr.de>; Wed,  8 Sep 2021 11:45:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 398942081E; Wed,  8 Sep 2021 09:45:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep  8 09:45:13 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id ECBCE2080E
	for <lists-other-nbd@bendel.debian.org>; Wed,  8 Sep 2021 09:27:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.628 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id QNolHFtnjfM9 for <lists-other-nbd@bendel.debian.org>;
	Wed,  8 Sep 2021 09:27:29 +0000 (UTC)
X-policyd-weight: using cached result; rate:hard: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by bendel.debian.org (Postfix) with ESMTP id 3E35E20802
	for <nbd@other.debian.org>; Wed,  8 Sep 2021 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631093244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WSMToU1uUMoHfun1y7dnDAkzWYwJfJzd2Z/oipy2Y5M=;
	b=TF0YB4uzMPV0rqsJyMSDR8k+3Zgl3rtFliCv7/0pbAPrZwzNNKwtjMfNc0NwPQCVc/Phi9
	uJ9jU/6SIVLj28Gi+09zdJb9B6+eqQ5KO0u5klmr17ilINsf5gqgh0igBUzGVfbVbZ61fY
	GZPlQW5iKGQbWw2rmIgEM8ThKVwosIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-UyvgIATwOhGSYXk-KyBkjw-1; Wed, 08 Sep 2021 05:27:20 -0400
X-MC-Unique: UyvgIATwOhGSYXk-KyBkjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862101023F4E;
	Wed,  8 Sep 2021 09:27:19 +0000 (UTC)
Received: from T590 (ovpn-12-207.pek2.redhat.com [10.72.12.207])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E50545D9DC;
	Wed,  8 Sep 2021 09:27:11 +0000 (UTC)
Date: Wed, 8 Sep 2021 17:27:13 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, nbd@other.debian.org,
	yi.zhang@huawei.com
Subject: Re: [PATCH v4 2/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YTiB8TLQ7ZJWvS7Y@T590>
References: <20210907140154.2134091-1-yukuai3@huawei.com>
 <20210907140154.2134091-3-yukuai3@huawei.com>
 <YThmhhI1/fZd29b1@T590>
 <e295605c-bc8e-cbb9-ca51-1355fdfc0264@huawei.com>
 <YThtq154oyROxBj9@T590>
 <2cfb6701-6e58-3e13-be85-472437a5b2ed@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2cfb6701-6e58-3e13-be85-472437a5b2ed@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <JC1m4xO85-G.A.Yk.pYIOhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1414
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YTiB8TLQ7ZJWvS7Y@T590
Resent-Date: Wed,  8 Sep 2021 09:45:13 +0000 (UTC)

On Wed, Sep 08, 2021 at 04:29:57PM +0800, yukuai (C) wrote:
> On 2021/09/08 16:00, Ming Lei wrote:
> > On Wed, Sep 08, 2021 at 03:37:06PM +0800, yukuai (C) wrote:
> > > On 2021/09/08 15:30, Ming Lei wrote:
> > > 
> > > > > +put_req:
> > > > > +	if (req)
> > > > > +		blk_mq_put_rq_ref(req);
> > > > >    	return ret ? ERR_PTR(ret) : cmd;
> > > > 
> > > > After the request's refcnt is dropped, it can be freed immediately, then
> > > > one stale command is returned to caller.
> > > 
> > > Hi, Ming
> > > 
> > > It's right this patch leave this problem. Please take a look at patch 3
> > > and patch 4, the problem should be fixed with these patches.
> > 
> > Not see it is addressed in patch 3 & 4, and it is one obvious fault in
> > patch 2, please fix it from beginning by moving the refcnt drop
> > into recv_work().
> 
> Hi, Ming
> 
> With patch 3 & 4:
> 
> if nbd_read_stat() return a valid cmd, then the refcnt should not drop
> to 0 before blk_mq_complete_request() in recv_work().

The valid cmd won't be timed out just between nbd_read_stat() and
calling blk_mq_complete_request()?

Yeah, the issue is addressed by patch 4, then please put 2 after
3 & 4, and suggest to add comment why request ref won't drop to zero
in recv_work().

> 
> if nbd_read_stat() failed, it won't be a problem if the request is freed
> immediately when refcnt is dropped in nbd_read_stat().
> 
> That's why I said that the problem will be fixed.
> 
> BTW, if we move the refcnt drop into recv_work, we can only do that if
> nbd_read_stat() return a valid cmd. If we get a valid rq and failed in
> the following checkings in nbd_read_stat(), it's better to drop the
> refcnt in nbd_read_stat().

The usual pattern is to drop the refcnt on when the object isn't used
any more, so it is perfectly fine to hold the ref until that time.


Thanks,
Ming

