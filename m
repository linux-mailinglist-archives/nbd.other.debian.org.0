Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8149BCF0A
	for <lists+nbd@lfdr.de>; Tue,  5 Nov 2024 15:21:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 61C38204EA; Tue,  5 Nov 2024 14:21:16 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  5 14:21:16 2024
Old-Return-Path: <kwolf@redhat.com>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=4.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL autolearn=no autolearn_force=no
	version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 588EB20498
	for <lists-other-nbd@bendel.debian.org>; Tue,  5 Nov 2024 14:03:35 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.538 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIMWL_WL_HIGH=-0.34, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
	RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
	RCVD_IN_MSPIKE_WL=0.001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fnkhsDLcQwNI for <lists-other-nbd@bendel.debian.org>;
	Tue,  5 Nov 2024 14:03:29 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by bendel.debian.org (Postfix) with ESMTP id EBE03204D9
	for <nbd@other.debian.org>; Tue,  5 Nov 2024 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730815403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a1YWEvpIV/hv1nANf3AYEhUmp9gUGHsaAanTGJypJ+s=;
	b=Ecg03RpiqWdyJWZbzT5Q1vAjl6HLu21Ms/lfjLOW5e0zXBkLGhuOuwY/6KLcfgMXQtlD/z
	Mx6oLtByUCScogzhxK2TXnSkVlLJgkBLZ1GVDniyDLeLIF0pUmYdf3g0ZM7OTnUp+OYAP4
	UzTUuQZI5IyJNtR2+wCumRsl4G4Zdv4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-272-w_GfUYeSPoiWKWPj3daBmw-1; Tue,
 05 Nov 2024 09:03:17 -0500
X-MC-Unique: w_GfUYeSPoiWKWPj3daBmw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9FE4A1955F67;
	Tue,  5 Nov 2024 14:03:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.127])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92849300018D;
	Tue,  5 Nov 2024 14:03:09 +0000 (UTC)
Date: Tue, 5 Nov 2024 15:03:06 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Ming Lei <ming.lei@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
	vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
	Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH V3] nbd: fix partial sending
Message-ID: <ZyolmjfJvYWmhcbS@redhat.com>
References: <20241029011941.153037-1-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029011941.153037-1-ming.lei@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <QeshXxVkJPG.A.3n0H.cniKnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3184
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/ZyolmjfJvYWmhcbS@redhat.com
Resent-Date: Tue,  5 Nov 2024 14:21:16 +0000 (UTC)

Am 29.10.2024 um 02:19 hat Ming Lei geschrieben:
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

> @@ -770,6 +798,14 @@ static blk_status_t nbd_send_cmd(struct nbd_device *nbd, struct nbd_cmd *cmd,
>  	return BLK_STS_OK;
>  
>  requeue:
> +	/*
> +	 * Can't requeue in case we are dealing with partial send
> +	 *
> +	 * We must run from pending work function.
> +	 * */
> +	if (test_bit(NBD_CMD_PARTIAL_SEND, &cmd->flags))
> +		return BLK_STS_OK;
> +
>  	/* retry on a different socket */
>  	dev_err_ratelimited(disk_to_dev(nbd->disk),
>  			    "Request send failed, requeueing\n");

This hunk doesn't feel ideal: The assumption in the normal code path
here is that the socket is dead, i.e. the error isn't recoverable. With
this way to handle it, nbd_pending_cmd_work() will keep retrying until
the request finally times out. We could probably return an error right
away.

In fact, I think even requeuing (and ideally still completing the
request successfully in the end) would be fine in this case because
we'll shut down the socket and never send any additional data on it, so
the server will never see a complete command. We would just have to make
sure that nbd_pending_cmd_work() doesn't try to complete sending the
command any more.

But even though this error path isn't optimal, I feel it might be
acceptable. Let's see if someone else has an opinion on it.

Tested-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>

