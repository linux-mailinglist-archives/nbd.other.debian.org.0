Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7009A2693
	for <lists+nbd@lfdr.de>; Thu, 17 Oct 2024 17:30:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 124D02062E; Thu, 17 Oct 2024 15:30:13 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Thu Oct 17 15:30:13 2024
Old-Return-Path: <bvanassche@acm.org>
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW autolearn=no
	autolearn_force=no version=3.4.6
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 0CC4A2059E
	for <lists-other-nbd@bendel.debian.org>; Thu, 17 Oct 2024 15:14:01 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.9 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id fNUETGQFA_Xj for <lists-other-nbd@bendel.debian.org>;
	Thu, 17 Oct 2024 15:13:55 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_MX=-3.1 (check from: .acm. - helo: .008.lax.mailroute. - helo-domain: .mailroute.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -6.6
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailroute.net", Issuer "R10" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 38772205AC
	for <nbd@other.debian.org>; Thu, 17 Oct 2024 15:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4XTrvf6cq6z6ClV8V;
	Thu, 17 Oct 2024 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1729178027; x=1731770028; bh=qFYEEpP53KRkg1LINGXAYWdQ
	Wprv/s8I+/BB+KJRCR8=; b=MnRpCyHLSlNcJmg49hapMrJ/5XV81YPK0KYIpE1x
	AnnYV+1xmqyoDkJ9SLR3RR67pmtvofCEh4HAF35mA2NriofMqBbdJwUH+/9BIvc4
	iQQdt/whUiDZPDWCE3rSnqgVvZCaHS0eE62IzG5pVLsdp5hZlizj1u4xsAD3ZXlJ
	EFNl+9x6sP60jjQ/J6u5SGujCKZWWxpuV7WwUpvrPcJtjLt7R5w2ZC4NCmYyURNI
	RBiWQP+rM4JSg7a+3M2dBSIjXpzTN7X0WXuUfiXx2WIoScH52l+amBOTpsMDVDH+
	sBkQo5AtpfzJugsvTrfC7/API0YJobLGfslySZHm9aTJ3Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id YN26AkC4Chr8; Thu, 17 Oct 2024 15:13:47 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4XTrvY6rxKz6ClSqL;
	Thu, 17 Oct 2024 15:13:45 +0000 (UTC)
Message-ID: <354b464e-4ae0-460b-b6d1-8ae208345bfa@acm.org>
Date: Thu, 17 Oct 2024 08:13:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nbd: fix partial sending
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: josef@toxicpanda.com, nbd@other.debian.org, eblake@redhat.com,
 vincent.chen@sifive.com, Leon Schuermann <leon@is.currently.online>,
 Kevin Wolf <kwolf@redhat.com>
References: <20241017113614.2964389-1-ming.lei@redhat.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241017113614.2964389-1-ming.lei@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <ZgxejJ1aELL.A.tYbM.E2SEnB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/3173
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/354b464e-4ae0-460b-b6d1-8ae208345bfa@acm.org
Resent-Date: Thu, 17 Oct 2024 15:30:13 +0000 (UTC)

On 10/17/24 4:36 AM, Ming Lei wrote:
> +static blk_status_t nbd_send_pending_cmd(struct nbd_device *nbd,
> +		struct nbd_cmd *cmd)
> +{
> +	struct request *req = blk_mq_rq_from_pdu(cmd);
> +	unsigned long deadline = READ_ONCE(req->deadline);
> +	unsigned int wait_ms = 2;
> +	blk_status_t res;
> +
> +	WARN_ON_ONCE(test_bit(NBD_CMD_REQUEUED, &cmd->flags));
> +
> +	while (true) {
> +		res = nbd_send_cmd(nbd, cmd, cmd->index);
> +		if (res != BLK_STS_RESOURCE)
> +			return res;
> +		if (READ_ONCE(jiffies) + msecs_to_jiffies(wait_ms) >= deadline)
> +			break;
> +		msleep(wait_ms);
> +		wait_ms *= 2;
> +	}

I think that there are better solutions to wait until more data
can be sent, e.g. by using the kernel equivalent of the C library
function select().

Thanks,

Bart.

