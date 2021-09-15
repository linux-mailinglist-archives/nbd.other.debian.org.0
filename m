Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id A377640BE47
	for <lists+nbd@lfdr.de>; Wed, 15 Sep 2021 05:33:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0FC8D206AE; Wed, 15 Sep 2021 03:33:10 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Sep 15 03:33:09 2021
Old-Return-Path: <ming.lei@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DIGITS_LETTERS,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,
	MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2 autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 1DDF8204D8
	for <lists-other-nbd@bendel.debian.org>; Wed, 15 Sep 2021 03:16:16 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.179 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIMWL_WL_HIGH=-0.398,
	DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
	DKIM_VALID_EF=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id kv456HAeRBSv for <lists-other-nbd@bendel.debian.org>;
	Wed, 15 Sep 2021 03:16:11 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id 335B7204B9
	for <nbd@other.debian.org>; Wed, 15 Sep 2021 03:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1631675766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zlyxS0b1FK2wfVn9hcZ7WHgk1exfB9oaJDccxJiZ+b8=;
	b=L459KHGVOlQ8PPXIPAQCJ+2Jx81h/bijEraOhjicZNsL8kY5ejp1av0wqSxICIiyBZizOe
	s7uS+RF+BkEVFkjxSXbz/SLxfWCXWe1GGDRX8T4UjArzlEQfLhPKYnDt4NRev/bY4sfTGu
	BPr/Lubw+ob1qTvr6fmcqvCfeeXSwsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-m5JDQB5rOWiq4iijiQWLVA-1; Tue, 14 Sep 2021 23:16:04 -0400
X-MC-Unique: m5JDQB5rOWiq4iijiQWLVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA7E100C661;
	Wed, 15 Sep 2021 03:16:03 +0000 (UTC)
Received: from T590 (ovpn-12-59.pek2.redhat.com [10.72.12.59])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D76B1972E;
	Wed, 15 Sep 2021 03:15:55 +0000 (UTC)
Date: Wed, 15 Sep 2021 11:16:06 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "yukuai (C)" <yukuai3@huawei.com>
Cc: axboe@kernel.dk, josef@toxicpanda.com, hch@infradead.org,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	nbd@other.debian.org, yi.zhang@huawei.com
Subject: Re: [PATCH v5 5/6] nbd: convert to use blk_mq_find_and_get_req()
Message-ID: <YUFldgfRYrJyxFtz@T590>
References: <20210909141256.2606682-1-yukuai3@huawei.com>
 <20210909141256.2606682-6-yukuai3@huawei.com>
 <YT/2z4PSeW5oJWMq@T590>
 <c6af73a2-f12d-eeef-616e-ae0cdb4f6f2d@huawei.com>
 <YUBE4BJ7+kN1c4l8@T590>
 <374c6b37-b4b2-fe01-66be-ca2dbbc283e9@huawei.com>
 <YUBTVBioqJ7qas2R@T590>
 <b8301834-5541-76ee-13a9-0fa565fce7e3@huawei.com>
 <YUCzr2ysb+vJ1x0W@T590>
 <8f1849a3-6bf2-6b14-7ef9-4969a9a5425b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f1849a3-6bf2-6b14-7ef9-4969a9a5425b@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <0kRhni04K3.A.okF.1lWQhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1463
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/YUFldgfRYrJyxFtz@T590
Resent-Date: Wed, 15 Sep 2021 03:33:10 +0000 (UTC)

On Wed, Sep 15, 2021 at 09:54:09AM +0800, yukuai (C) wrote:
> On 2021/09/14 22:37, Ming Lei wrote:
> > On Tue, Sep 14, 2021 at 05:19:31PM +0800, yukuai (C) wrote:
> > > On 在 2021/09/14 15:46, Ming Lei wrote:
> > > 
> > > > If the above can happen, blk_mq_find_and_get_req() may not fix it too, just
> > > > wondering why not take the following simpler way for avoiding the UAF?
> > > > 
> > > > diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> > > > index 5170a630778d..dfa5cce71f66 100644
> > > > --- a/drivers/block/nbd.c
> > > > +++ b/drivers/block/nbd.c
> > > > @@ -795,9 +795,13 @@ static void recv_work(struct work_struct *work)
> > > >    						     work);
> > > >    	struct nbd_device *nbd = args->nbd;
> > > >    	struct nbd_config *config = nbd->config;
> > > > +	struct request_queue *q = nbd->disk->queue;
> > > >    	struct nbd_cmd *cmd;
> > > >    	struct request *rq;
> > > > +	if (!percpu_ref_tryget(&q->q_usage_counter))
> > > > +                return;
> > > > +
> > > >    	while (1) {
> > > >    		cmd = nbd_read_stat(nbd, args->index);
> > > >    		if (IS_ERR(cmd)) {
> > > > @@ -813,6 +817,7 @@ static void recv_work(struct work_struct *work)
> > > >    		if (likely(!blk_should_fake_timeout(rq->q)))
> > > >    			blk_mq_complete_request(rq);
> > > >    	}
> > > > +	blk_queue_exit(q);
> > > >    	nbd_config_put(nbd);
> > > >    	atomic_dec(&config->recv_threads);
> > > >    	wake_up(&config->recv_wq);
> > > > 
> > > 
> > > Hi, Ming
> > > 
> > > This apporch is wrong.
> > > 
> > > If blk_mq_freeze_queue() is called, and nbd is waiting for all
> > > request to complete. percpu_ref_tryget() will fail here, and deadlock
> > > will occur because request can't complete in recv_work().
> > 
> > No, percpu_ref_tryget() won't fail until ->q_usage_counter is zero, when
> > it is perfectly fine to do nothing in recv_work().
> > 
> 
> Hi Ming
> 
> This apporch is a good idea, however we should not get q_usage_counter
> in reccv_work(), because It will block freeze queue.
> 
> How about get q_usage_counter in nbd_read_stat(), and put in error path
> or after request completion?

OK, looks I missed that nbd_read_stat() needs to wait for incoming reply
first, so how about the following change by partitioning nbd_read_stat()
into nbd_read_reply() and nbd_handle_reply()?

diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
index 5170a630778d..477fe057fc93 100644
--- a/drivers/block/nbd.c
+++ b/drivers/block/nbd.c
@@ -683,38 +683,47 @@ static int nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd, int index)
 	return 0;
 }
 
-/* NULL returned = something went wrong, inform userspace */
-static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
+static int nbd_read_reply(struct nbd_device *nbd, int index,
+		struct nbd_reply *reply)
 {
-	struct nbd_config *config = nbd->config;
 	int result;
-	struct nbd_reply reply;
-	struct nbd_cmd *cmd;
-	struct request *req = NULL;
-	u64 handle;
-	u16 hwq;
-	u32 tag;
-	struct kvec iov = {.iov_base = &reply, .iov_len = sizeof(reply)};
+	struct kvec iov = {.iov_base = reply, .iov_len = sizeof(*reply)};
 	struct iov_iter to;
-	int ret = 0;
 
-	reply.magic = 0;
+	reply->magic = 0;
 	iov_iter_kvec(&to, READ, &iov, 1, sizeof(reply));
 	result = sock_xmit(nbd, index, 0, &to, MSG_WAITALL, NULL);
-	if (result <= 0) {
-		if (!nbd_disconnected(config))
+	if (result < 0) {
+		if (!nbd_disconnected(nbd->config))
 			dev_err(disk_to_dev(nbd->disk),
 				"Receive control failed (result %d)\n", result);
-		return ERR_PTR(result);
+		return result;
 	}
 
-	if (ntohl(reply.magic) != NBD_REPLY_MAGIC) {
+	if (ntohl(reply->magic) != NBD_REPLY_MAGIC) {
 		dev_err(disk_to_dev(nbd->disk), "Wrong magic (0x%lx)\n",
-				(unsigned long)ntohl(reply.magic));
-		return ERR_PTR(-EPROTO);
+				(unsigned long)ntohl(reply->magic));
+		return -EPROTO;
 	}
 
-	memcpy(&handle, reply.handle, sizeof(handle));
+	return 0;
+}
+
+/* NULL returned = something went wrong, inform userspace */
+static struct nbd_cmd *nbd_handle_reply(struct nbd_device *nbd, int index,
+		struct nbd_reply *reply)
+{
+	struct nbd_config *config = nbd->config;
+	int result;
+	struct nbd_cmd *cmd;
+	struct request *req = NULL;
+	u64 handle;
+	u16 hwq;
+	u32 tag;
+	struct iov_iter to;
+	int ret = 0;
+
+	memcpy(&handle, reply->handle, sizeof(handle));
 	tag = nbd_handle_to_tag(handle);
 	hwq = blk_mq_unique_tag_to_hwq(tag);
 	if (hwq < nbd->tag_set.nr_hw_queues)
@@ -747,9 +756,9 @@ static struct nbd_cmd *nbd_read_stat(struct nbd_device *nbd, int index)
 		ret = -ENOENT;
 		goto out;
 	}
-	if (ntohl(reply.error)) {
+	if (ntohl(reply->error)) {
 		dev_err(disk_to_dev(nbd->disk), "Other side returned error (%d)\n",
-			ntohl(reply.error));
+			ntohl(reply->error));
 		cmd->status = BLK_STS_IOERR;
 		goto out;
 	}
@@ -795,24 +804,36 @@ static void recv_work(struct work_struct *work)
 						     work);
 	struct nbd_device *nbd = args->nbd;
 	struct nbd_config *config = nbd->config;
+	struct request_queue *q = nbd->disk->queue;
+	struct nbd_sock *nsock;
 	struct nbd_cmd *cmd;
 	struct request *rq;
 
 	while (1) {
-		cmd = nbd_read_stat(nbd, args->index);
-		if (IS_ERR(cmd)) {
-			struct nbd_sock *nsock = config->socks[args->index];
+		struct nbd_reply reply;
 
-			mutex_lock(&nsock->tx_lock);
-			nbd_mark_nsock_dead(nbd, nsock, 1);
-			mutex_unlock(&nsock->tx_lock);
+		if (nbd_read_reply(nbd, args->index, &reply))
 			break;
-		}
 
+		if (!percpu_ref_tryget(&q->q_usage_counter))
+			break;
+
+		cmd = nbd_handle_reply(nbd, args->index, &reply);
+		if (IS_ERR(cmd)) {
+			blk_queue_exit(q);
+			break;
+		}
 		rq = blk_mq_rq_from_pdu(cmd);
 		if (likely(!blk_should_fake_timeout(rq->q)))
 			blk_mq_complete_request(rq);
+		blk_queue_exit(q);
 	}
+
+	nsock = config->socks[args->index];
+	mutex_lock(&nsock->tx_lock);
+	nbd_mark_nsock_dead(nbd, nsock, 1);
+	mutex_unlock(&nsock->tx_lock);
+
 	nbd_config_put(nbd);
 	atomic_dec(&config->recv_threads);
 	wake_up(&config->recv_wq);


Thanks,
Ming

