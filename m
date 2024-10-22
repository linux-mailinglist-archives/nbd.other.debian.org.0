Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF39AB663
	for <lists+nbd@lfdr.de>; Tue, 22 Oct 2024 21:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 2C10F206D6; Tue, 22 Oct 2024 19:03:11 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Oct 22 19:03:11 2024
Old-Return-Path: <kwolf@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FOURLA,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0988A20728
	for <lists-other-nbd@bendel.debian.org>; Tue, 22 Oct 2024 18:46:31 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.519 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.421, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FOURLA=0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 5Zn94aZ0Ev3V for <lists-other-nbd@bendel.debian.org>;
	Tue, 22 Oct 2024 18:46:25 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .redhat. - helo: .us-smtp-delivery-124.mimecast. - helo-domain: .mimecast.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EE0F120729
	for <nbd@other.debian.org>; Tue, 22 Oct 2024 18:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729622779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k8tLD3CI7E5sRuXkeFnUjHcUQQplTqarTlnIPHod/vw=;
	b=iaqsguiI5quDDiA5owWcvDRcdVh9kA4426+Gli3J36MqZZDr7RDUrJ4sRkE/TI+AycyEqW
	Xfp1z6/9NyRZzBY7uhQFtiLHjF8u6+wOw7bK8RhvRRNO0O6gVFpqXIjTUued1f07MbyT9d
	+OBA1EXIUUmP6bbCNBq259GIpQ3vEIo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-UG1dWRuSP_OVXFMt1KCV5g-1; Tue,
 22 Oct 2024 14:46:17 -0400
X-MC-Unique: UG1dWRuSP_OVXFMt1KCV5g-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D140D195608B;
	Tue, 22 Oct 2024 18:46:15 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.70])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2E1FF1956088;
	Tue, 22 Oct 2024 18:46:11 +0000 (UTC)
Date: Tue, 22 Oct 2024 20:46:07 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
	vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH V2] nbd: fix partial sending
Message-ID: <Zxfy7-xIsoMVtUlz@redhat.com>
References: <20241018140831.3064135-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018140831.3064135-1-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ygWOvuviXmJ.A.1ABM.vb_FnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3180
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/Zxfy7-xIsoMVtUlz@redhat.com
Resent-Date: Tue, 22 Oct 2024 19:03:11 +0000 (UTC)

Am 18.10.2024 um 16:08 hat Ming Lei geschrieben:
> nbd driver sends request header and payload with multiple call of
> sock_sendmsg, and partial sending can't be avoided. However, nbd driver
> returns BLK_STS_RESOURCE to block core in this situation. This way causes
> one issue: request->tag may change in the next run of nbd_queue_rq(), but
> the original old tag has been sent as part of header cookie, this way
> confuses nbd driver reply handling, since the real request can't be
> retrieved any more with the obsolete old tag.
> 
> Fix it by retrying sending directly in per-socket work function,
> meantime return BLK_STS_OK to block layer core.
> 
> Cc: vincent.chen@sifive.com
> Cc: Leon Schuermann <leon@is.currently.online>
> Cc: Bart Van Assche <bvanassche@acm.org>
> Reported-by: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Ming Lei <ming.lei@redhat.com>
> ---
> V2:
> 	- move pending retry to socket work function and return BLK_STS_OK, so that
> 	userspace can get chance to handle the signal(Kevin)

So first of all: This seems to work.

But looking through the code I have a few comments:

>  drivers/block/nbd.c | 89 +++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 77 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index b852050d8a96..855f4a79e37c 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -62,6 +62,7 @@ struct nbd_sock {
>  	bool dead;
>  	int fallback_index;
>  	int cookie;
> +	struct work_struct work;
>  };
>  
>  struct recv_thread_args {
> @@ -141,6 +142,9 @@ struct nbd_device {
>   */
>  #define NBD_CMD_INFLIGHT	2
>  
> +/* Just part of request header or data payload is sent successfully */
> +#define NBD_CMD_PARTIAL_SEND	3
> +
>  struct nbd_cmd {
>  	struct nbd_device *nbd;
>  	struct mutex lock;
> @@ -466,6 +470,12 @@ static enum blk_eh_timer_return nbd_xmit_timeout(struct request *req)
>  	if (!mutex_trylock(&cmd->lock))
>  		return BLK_EH_RESET_TIMER;
>  
> +	/* partial send is handled in nbd_sock's work function */
> +	if (test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags)) {
> +		mutex_unlock(&cmd->lock);
> +		return BLK_EH_RESET_TIMER;
> +	}
> +
>  	if (!test_bit(NBD_CMD_INFLIGHT, &cmd->flags)) {
>  		mutex_unlock(&cmd->lock);
>  		return BLK_EH_DONE;
> @@ -614,6 +624,27 @@ static inline int was_interrupted(int result)
>  	return result == -ERESTARTSYS || result == -EINTR;
>  }
>  
> +/*
> + * We've already sent header or part of data payload, have no choice but
> + * to set pending and schedule it in work.
> + *
> + * And we have to return BLK_STS_OK to block core, otherwise this same
> + * request may be re-dispatched with different tag, but our header has
> + * been sent out with old tag, and this way does confuse reply handling.
> + */
> +static void nbd_run_pending_work(struct nbd_device *nbd,
> +				 struct nbd_sock *nsock,
> +				 struct nbd_cmd *cmd, int sent)

The name of this function is a bit confusing, we don't actually run
anything here. Maybe nbd_schedule_pending_work()? Or something else with
"schedule" and "send".

> +{
> +	struct request *req = blk_mq_rq_from_pdu(cmd);
> +
> +	nsock->pending = req;
> +	nsock->sent = sent;
> +	set_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags);
> +	refcount_inc(&nbd->config_refs);
> +	schedule_work(&nsock->work);
> +}

Important point about this function: It doesn't check if we already have
scheduled the work. You seem to have some code in nbd_pending_cmd_work()
that can cope with being scheduled multiple times, but allowing the
situation makes the control flow hard to follow. It would probably be
better to avoid this and call refcount_inc() and schedule_work() only if
NBD_CMD_PARTIAL_SEND isn't already set.

> +
>  /*
>   * Returns BLK_STS_RESOURCE if the caller should retry after a delay.
>   * Returns BLK_STS_IOERR if sending failed.
> @@ -699,11 +730,12 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
>  			 * completely done.
>  			 */
>  			if (sent) {
> -				nsock->pending = req;
> -				nsock->sent = sent;
> +				nbd_run_pending_work(nbd, nsock, cmd, sent);
> +				return BLK_STS_OK;

Now the question is if requeuing is already implicitly avoided, because
returning EINTR to a worker doesn't seem to make a lot of sense to me,
and so we might actually never hit this code path from a worker. But I'm
not completely sure. Maybe better to detect the situation in
nbd_run_pending_work() anyway.

> +			} else {
> +				set_bit(NBD_CMD_REQUEUED, &cmd->flags);
> +				return BLK_STS_RESOURCE;
>  			}
> -			set_bit(NBD_CMD_REQUEUED, &cmd->flags);
> -			return BLK_STS_RESOURCE;

This is an unrelated style change.

>  		}
>  		dev_err_ratelimited(disk_to_dev(nbd->disk),
>  			"Send control failed (result %d)\n", result);
> @@ -737,14 +769,8 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
>  			result = sock_xmit(nbd, index, 1, &from, flags, &sent);
>  			if (result < 0) {
>  				if (was_interrupted(result)) {
> -					/* We've already sent the header, we
> -					 * have no choice but to set pending and
> -					 * return BUSY.
> -					 */
> -					nsock->pending = req;
> -					nsock->sent = sent;
> -					set_bit(NBD_CMD_REQUEUED, &cmd->flags);
> -					return BLK_STS_RESOURCE;
> +					nbd_run_pending_work(nbd, nsock, cmd, sent);
> +					return BLK_STS_OK;
>  				}
>  				dev_err(disk_to_dev(nbd->disk),
>  					"Send data failed (result %d)\n",
> @@ -778,6 +804,44 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
>  	return BLK_STS_OK;
>  }
>  
> +/* handle partial sending */
> +static void nbd_pending_cmd_work(struct work_struct *work)
> +{
> +	struct nbd_sock *nsock = container_of(work, struct nbd_sock, work);
> +	struct request *req = nsock->pending;
> +	struct nbd_cmd *cmd = blk_mq_rq_to_pdu(req);
> +	struct nbd_device *nbd = cmd->nbd;
> +	unsigned long deadline = READ_ONCE(req->deadline);
> +	unsigned int wait_ms = 2;
> +
> +	mutex_lock(&cmd->lock);
> +
> +	WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
> +	if (!test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags))
> +		goto out;

I believe this check is only for detecting if the work was scheduled
multiple times? If we avoid that above, we probably can make this a
WARN_ON_ONCE(), too.

> +
> +	mutex_lock(&nsock->tx_lock);
> +	while (true) {
> +		nbd_send_cmd(nbd, cmd, cmd->index);
> +		if (!nsock->pending)
> +			break;

If it's true that we can never get EINTR or ERESTARTSYS in a worker,
then this condition would always be true and the loop and sleeping logic
is unnecessary.

If it actually is necessary, I wonder if it wouldn't be better to just
let nbd_send_cmd() reschedule the work without a loop and sleeping here.
I'm not entirely sure what EINTR/ERESTARTSYS should even mean in this
context, but like in the .queue_rq() path, the thing that clears these
error conditions would probably be returning, not sleeping?

> +
> +		/* don't bother timeout handler for partial sending */
> +		if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline) {
> +			cmd->status = BLK_STS_IOERR;
> +			blk_mq_complete_request(req);
> +			break;
> +		}
> +		msleep(wait_ms);
> +		wait_ms *= 2;
> +	}
> +	mutex_unlock(&nsock->tx_lock);
> +	clear_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags);
> +out:
> +	mutex_unlock(&cmd->lock);
> +	nbd_config_put(nbd);
> +}

Kevin

