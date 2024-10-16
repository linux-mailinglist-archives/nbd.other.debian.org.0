Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90599FF04
	for <lists+nbd@lfdr.de>; Wed, 16 Oct 2024 04:45:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E06F8207B5; Wed, 16 Oct 2024 02:45:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Oct 16 02:45:11 2024
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,FVGT_m_MULTI_ODD,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS
	autolearn=no autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 11AB620759
	for <lists-other-nbd@bendel.debian.org>; Wed, 16 Oct 2024 02:27:28 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=1.104 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.153, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	FVGT_m_MULTI_ODD=0.02, RCVD_IN_DNSWL_NONE=-0.0001,
	RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
	RCVD_IN_SBL_CSS=3.335] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 6yvGFLXxf1iN for <lists-other-nbd@bendel.debian.org>;
	Wed, 16 Oct 2024 02:27:21 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
X-Greylist: delayed 393 seconds by postgrey-1.36 at bendel; Wed, 16 Oct 2024 02:27:20 UTC
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id BD38020749
	for <nbd@other.debian.org>; Wed, 16 Oct 2024 02:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729045635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JtkzWmb3v2Kya88XF5r05Dzzq1TjatlGQl6PEB9CFo0=;
	b=a96yAwhfmq0ogbp5ujbjkz8jb1WhfutJXPOgDVFqRvrOOLakWtOPuUyxQfr33NERRvRe9D
	gd9UnnWmcblxPVAvFnJ7i49kTokDRXi5sfFsAGHinRb9use95WrysPHl2kRY6A/2A2YPU1
	N0aL6dncXlnMJGyIxXtxaOqq/KMuaIw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-aYWiNu3bMg2JYbsZNRWxdA-1; Tue,
 15 Oct 2024 22:20:40 -0400
X-MC-Unique: aYWiNu3bMg2JYbsZNRWxdA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8ADE11956048;
	Wed, 16 Oct 2024 02:20:38 +0000 (UTC)
Received: from fedora (unknown [10.72.116.125])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EB6D19560A2;
	Wed, 16 Oct 2024 02:20:33 +0000 (UTC)
Date: Wed, 16 Oct 2024 10:20:27 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: josef@toxicpanda.com, axboe@kernel.dk, linux-block@vger.kernel.org,
	nbd@other.debian.org, eblake@redhat.com
Subject: Re: Kernel NBD client waits on wrong cookie, aborts connection
Message-ID: <Zw8i6-DVDsLk3sq9@fedora>
References: <Zw5CNDIde6xkq_Sf@redhat.com>
 <CAFj5m9LXwcH7vc2Fk_i+VhfUA+tevzhciJzKc1am49y_5jgC2Q@mail.gmail.com>
 <Zw5b1mwk3aG01NTg@fedora>
 <CAFj5m9+x+tiAAKj3dX_WcFczkdSNaR6nguDHm9FXuYjQHd8YcA@mail.gmail.com>
 <Zw5nMQoPrSIq9axl@fedora>
 <Zw6S6RoKWzUnNVpu@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="iXMVhU/JkJ/GtypL"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zw6S6RoKWzUnNVpu@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <nmnJpc6yK6.A.ZXUM.3iyDnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3168
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zw8i6-DVDsLk3sq9@fedora
Resent-Date: Wed, 16 Oct 2024 02:45:11 +0000 (UTC)


--iXMVhU/JkJ/GtypL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Oct 15, 2024 at 06:06:01PM +0200, Kevin Wolf wrote:
> Am 15.10.2024 um 14:59 hat Ming Lei geschrieben:
> > On Tue, Oct 15, 2024 at 08:15:17PM +0800, Ming Lei wrote:
> > > On Tue, Oct 15, 2024 at 8:11 PM Ming Lei <ming.lei@redhat.com> wrote:
> > > >
> > > > On Tue, Oct 15, 2024 at 08:01:43PM +0800, Ming Lei wrote:
> > > > > On Tue, Oct 15, 2024 at 6:22 PM Kevin Wolf <kwolf@redhat.com> wrote:
> > > > > >
> > > > > > Hi all,
> > > > > >
> > > > > > the other day I was running some benchmarks to compare different QEMU
> > > > > > block exports, and one of the scenarios I was interested in was
> > > > > > exporting NBD from qemu-storage-daemon over a unix socket and attaching
> > > > > > it as a block device using the kernel NBD client. I would then run a VM
> > > > > > on top of it and fio inside of it.
> > > > > >
> > > > > > Unfortunately, I couldn't get any numbers because the connection always
> > > > > > aborted with messages like "Double reply on req ..." or "Unexpected
> > > > > > reply ..." in the host kernel log.
> > > > > >
> > > > > > Yesterday I found some time to have a closer look why this is happening,
> > > > > > and I think I have a rough understanding of what's going on now. Look at
> > > > > > these trace events:
> > > > > >
> > > > > >         qemu-img-51025   [005] ..... 19503.285423: nbd_header_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005a
> > > > > > [...]
> > > > > >         qemu-img-51025   [008] ..... 19503.285500: nbd_payload_sent: nbd transport event: request 000000002df03708, handle 0x0000150c0000005d
> > > > > > [...]
> > > > > >    kworker/u49:1-47350   [004] ..... 19503.285514: nbd_header_received: nbd transport event: request 00000000b79e7443, handle 0x0000150c0000005a
> > > > > >
> > > > > > This is the same request, but the handle has changed between
> > > > > > nbd_header_sent and nbd_payload_sent! I think this means that we hit one
> > > > > > of the cases where the request is requeued, and then the next time it
> > > > > > is executed with a different blk-mq tag, which is something the nbd
> > > > > > driver doesn't seem to expect.
> > > > > >
> > > > > > Of course, since the cookie is transmitted in the header, the server
> > > > > > replies with the original handle that contains the tag from the first
> > > > > > call, while the kernel is only waiting for a handle with the new tag and
> > > > > > is confused by the server response.
> > > > > >
> > > > > > I'm not sure yet which of the following options should be considered the
> > > > > > real problem here, so I'm only describing the situation without trying
> > > > > > to provide a patch:
> > > > > >
> > > > > > 1. Is it that blk-mq should always re-run the request with the same tag?
> > > > > >    I don't expect so, though in practice I was surprised to see that it
> > > > > >    happens quite often after nbd requeues a request that it actually
> > > > > >    does end up with the same cookie again.
> > > > >
> > > > > No.
> > > > >
> > > > > request->tag will change, but we may take ->internal_tag(sched) or
> > > > > ->tag(none), which won't change.
> > > > >
> > > > > I guess was_interrupted() in nbd_send_cmd() is triggered, then the payload
> > > > > is sent with a different tag.
> > > > >
> > > > > I will try to cook one patch soon.
> > > >
> > > > Please try the following patch:
> > > 
> > > Oops, please ignore the patch, it can't work since
> > > nbd_handle_reply() doesn't know static tag.
> > 
> > Please try the v2:
> 
> It doesn't fully work, though it replaced the bug with a different one.
> Now I get "Unexpected request" for the final flush request.

That just shows the approach is working.

Flush request doesn't have static tag, that is why it is failed.
It shouldn't be hard to cover it, please try the attached & revised
patch.

Another solution is to add per-nbd-device map for retrieving nbd_cmd
by the stored `index` in cookie, and the cost is one such array for
each device.

> 
> Anyway, before talking about specific patches, would this even be the
> right solution or would it only paper over a bigger issue?
> 
> Is getting a different tag the only thing that can go wrong if you
> handle a request partially and then requeue it?

Strictly speaking it is BLK_STS_RESOURCE.

Not like userspace implementation, kernel nbd call one sock_sendmsg()
for sending either request header, or each single data bvec, so partial xmit
can't be avoided. This kind of handling is fine, given TCP is just
byte stream, nothing difference is observed from nbd server side if
data is correct.


Thanks,
Ming

--iXMVhU/JkJ/GtypL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="static-tag.patch"

diff --git a/block/blk-mq-tag.c b/block/blk-mq-tag.c
index 2cafcf11ee8b..3cc14fc76546 100644
--- a/block/blk-mq-tag.c
+++ b/block/blk-mq-tag.c
@@ -682,3 +682,51 @@ u32 blk_mq_unique_tag(struct request *rq)
 		(rq->tag & BLK_MQ_UNIQUE_TAG_MASK);
 }
 EXPORT_SYMBOL(blk_mq_unique_tag);
+
+/* Same with blk_mq_unique_tag, but one persistent tag is included */
+u32 blk_mq_unique_static_tag(struct request *rq)
+{
+	bool use_sched = rq->q->elevator;
+	u32 tag;
+
+	if (rq == rq->mq_hctx->fq->flush_rq) {
+		if (use_sched)
+			tag = rq->mq_hctx->sched_tags->nr_tags;
+		else
+			tag = rq->mq_hctx->tags->nr_tags;
+	} else {
+		tag = use_sched ? rq->internal_tag : rq->tag;
+	}
+
+	return (rq->mq_hctx->queue_num << BLK_MQ_UNIQUE_TAG_BITS) |
+		(tag & BLK_MQ_UNIQUE_TAG_MASK);
+}
+EXPORT_SYMBOL(blk_mq_unique_static_tag);
+
+static struct request *
+__blk_mq_static_tag_to_rq(const struct blk_mq_hw_ctx *hctx,
+		const struct blk_mq_tags *tags, u32 tag)
+{
+	if (tag < tags->nr_tags)
+		return tags->static_rqs[tag];
+	else if (tag == tags->nr_tags)
+		return hctx->fq->flush_rq;
+	else
+		return NULL;
+}
+
+struct request *blk_mq_static_tag_to_req(struct request_queue *q, u32 uniq_tag)
+{
+	unsigned long hwq = blk_mq_unique_tag_to_hwq(uniq_tag);
+	u32 tag = blk_mq_unique_tag_to_tag(uniq_tag);
+	const struct blk_mq_hw_ctx *hctx= xa_load(&q->hctx_table, hwq);
+
+	if (!hctx)
+		return NULL;
+
+	if (q->elevator)
+		return __blk_mq_static_tag_to_rq(hctx, hctx->sched_tags, tag);
+
+	return __blk_mq_static_tag_to_rq(hctx, hctx->tags, tag);
+}
+EXPORT_SYMBOL(blk_mq_static_tag_to_req);
diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index b852050d8a96..5be324233c9f 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -201,7 +201,7 @@ static void nbd_requeue_cmd(struct nbd_cmd *cmd)
 static u64 nbd_cmd_handle(struct nbd_cmd *cmd)
 {
 	struct request *req = blk_mq_rq_from_pdu(cmd);
-	u32 tag = blk_mq_unique_tag(req);
+	u32 tag = blk_mq_unique_static_tag(req);
 	u64 cookie = cmd->cmd_cookie;
 
 	return (cookie << NBD_COOKIE_BITS) | tag;
@@ -818,10 +818,7 @@ static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
 
 	handle = be64_to_cpu(reply->cookie);
 	tag = nbd_handle_to_tag(handle);
-	hwq = blk_mq_unique_tag_to_hwq(tag);
-	if (hwq < nbd->tag_set.nr_hw_queues)
-		req = blk_mq_tag_to_rq(nbd->tag_set.tags[hwq],
-				       blk_mq_unique_tag_to_tag(tag));
+	req = blk_mq_static_tag_to_req(nbd->disk->queue, tag);
 	if (!req || !blk_mq_request_started(req)) {
 		dev_err(disk_to_dev(nbd->disk), "Unexpected reply (%d) %p\n",
 			tag, req);
diff --git a/include/linux/blk-mq.h b/include/linux/blk-mq.h
index 4fecf46ef681..9c4ef3f16a77 100644
--- a/include/linux/blk-mq.h
+++ b/include/linux/blk-mq.h
@@ -793,6 +793,8 @@ enum {
 };
 
 u32 blk_mq_unique_tag(struct request *rq);
+u32 blk_mq_unique_static_tag(struct request *rq);
+struct request *blk_mq_static_tag_to_req(struct request_queue *q, u32 tag);
 
 static inline u16 blk_mq_unique_tag_to_hwq(u32 unique_tag)
 {

--iXMVhU/JkJ/GtypL--

