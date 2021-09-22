Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id AD36941455A
	for <lists+nbd@lfdr.de>; Wed, 22 Sep 2021 11:39:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 55E0520DF0; Wed, 22 Sep 2021 09:39:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 22 09:39:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MURPHY_DRUGS_REL8,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id B888520DD9
	for <lists-other-nbd@bendel.debian.org>; Wed, 22 Sep 2021 09:22:22 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.279 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_LOW=-0.7,
	RCVD_IN_MSPIKE_H2=-0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id RAg52rf71h_C for <lists-other-nbd@bendel.debian.org>;
	Wed, 22 Sep 2021 09:22:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id ED2BD20DE1
	for <nbd@other.debian.org>; Wed, 22 Sep 2021 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632302534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=F3Q68iPY2i1vTKFIBJAwvjKbsdFYrmn07/rm3Ve2c6E=;
	b=LDV35lMtZfDZpsUuKk41QOHqjkmam4W7YfKPl1xRMS4+Sl/rx0BQo71wkD2MwBmuiR0W4R
	oGk642Gt8D6ya6kLs8c2u4v1LitO+NTnaE5kOdJ89LQf8H2lRhnOv/KAzjhzeSxA5l3Tck
	iBzMdymuva3knTTGPCPbxVrXVMoQsio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-j1dwDayBO225cQshvljKnw-1; Wed, 22 Sep 2021 05:22:09 -0400
X-MC-Unique: j1dwDayBO225cQshvljKnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D1B1006B10;
	Wed, 22 Sep 2021 09:22:08 +0000 (UTC)
Received: from T590 (ovpn-8-35.pek2.redhat.com [10.72.8.35])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C39D385;
	Wed, 22 Sep 2021 09:21:56 +0000 (UTC)
Date: Wed, 22 Sep 2021 17:22:07 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, hch@infradead.org,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Subject: Re: [patch v8 3/7] nbd: check sock index in nbd_read_stat()
Message-ID: <YUr1v8zylPOFFXTO@T590>
References: <20210916093350.1410403-1-yukuai3@huawei.com>
 <20210916093350.1410403-4-yukuai3@huawei.com>
 <7e2913ca-1089-9ab7-cfdb-5e8837d36034@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e2913ca-1089-9ab7-cfdb-5e8837d36034@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <sG26RMCxJYF.A.uJF.9mvShB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1516
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUr1v8zylPOFFXTO@T590
Resent-Date: Wed, 22 Sep 2021 09:39:09 +0000 (UTC)

On Sun, Sep 19, 2021 at 06:34:28PM +0800, yukuai (C) wrote:
> On 2021/09/16 17:33, Yu Kuai wrote:
> > The sock that clent send request in nbd_send_cmd() and receive reply
> > in nbd_read_stat() should be the same.
> > 
> > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > ---
> >   drivers/block/nbd.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > index 614c6ab2b8fe..c724a5bd7fa4 100644
> > --- a/drivers/block/nbd.c
> > +++ b/drivers/block/nbd.c
> > @@ -746,6 +746,10 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
> >   		ret = -ENOENT;
> >   		goto out;
> >   	}
> > +	if (cmd->index != index) {
> > +		dev_err(disk_to_dev(nbd->disk), "Unexpected reply %d from different sock %d (expected %d)",
> > +			tag, index, cmd->index);
> > +	}
> >   	if (cmd->cmd_cookie != nbd_handle_to_cookie(handle)) {
> >   		dev_err(disk_to_dev(nbd->disk), "Double reply on req %p, cmd_cookie %u, handle cookie %u\n",
> >   			req, cmd->cmd_cookie, nbd_handle_to_cookie(handle));
> > 
> 
> Hi, Ming
> 
> Any suggestions about this patch?

I think this one relies on nbd protocol between server and client, and
does the protocol require both request and reply xmitted via same
socket?


Thanks,
Ming

