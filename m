Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2092A4C8A
	for <lists+nbd@lfdr.de>; Tue,  3 Nov 2020 18:18:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id E5A5D20566; Tue,  3 Nov 2020 17:18:09 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Nov  3 17:18:09 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,FOURLA,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 6101A204D2
	for <lists-other-nbd@bendel.debian.org>; Tue,  3 Nov 2020 17:00:23 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-0.881 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, FOURLA=0.1, MURPHY_DRUGS_REL8=0.02,
	NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id mdyvup5kRnj5 for <lists-other-nbd@bendel.debian.org>;
	Tue,  3 Nov 2020 17:00:18 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x72b.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 4AAC5205AB
	for <nbd@other.debian.org>; Tue,  3 Nov 2020 17:00:17 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id l2so15348441qkf.0
        for <nbd@other.debian.org>; Tue, 03 Nov 2020 09:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iJnXv0Jwsde3O3oEWNodcFfjp3Bap9KYUTkDBs3BMm0=;
        b=D4UHq7dLxqxZPGPF4a1OIPwJgR0uIzYcvluQp4XvV0FzTFyksROTOKJpc6qaXYhLFc
         qmpB2ds0DhSU6/KtQDvLlPQA+eCXFGODr/5YKHk/qnQfYTudoc2c+DheZN/SRB5XDx6j
         QMSbQZnj8/wHWfVjAx1sineN5hsemvoXOkQG7p1MR8Ht/1+zlud2YClr+RXr3AoWEoie
         S7n2w7kwXSV8/khx9S6l6aNlrCo+ULqtBEAHcSEP2P3Yz4Qcr6V1ysPbSvquk60+EB9O
         DbKSIrsG3Fj+1yFjshbMRRPVVbaVWp+0US3jSJ6XtcEMlDeLCpINKw31tMiUUw8oEXpM
         I2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iJnXv0Jwsde3O3oEWNodcFfjp3Bap9KYUTkDBs3BMm0=;
        b=M8yixAvrsvBol+LZr4AnFEGj0ElDa3Fbidf02Ul1Zzbp0dBeIS1oUZxCtdIYRrTcw0
         vVaV0KZYMX3WdSOAoAbf1fD4chsF5m/KX36JFW3+Us7J4OzPB0J9KInZzWWmjOj9wOcn
         z9cdns/O9JiDJmA3s1UfQLLxpABjuWhqGE9dMmWb+m//OBX8S9bj6CZW5BkiIOgy7d3b
         GwUdwEclv+FqoASi2QlxyvIkhyjrIBLG83hdojJVYJFswn30Ie9cc3BUomNLaity4agg
         RFlWB0R8BfiTL2physDdFzlwFQe517RXLR398fHHh/BysfKIjNAKwmAsJstjkljD6Jgu
         BC1A==
X-Gm-Message-State: AOAM530+BBLGgPc5dKUS3eswo/0B1gA9XhdTUgYj37XC986HrJmcYOWN
	syWn5+vhNlzXz4iCjXxkGXi/ZA==
X-Google-Smtp-Source: ABdhPJwAwCU/5gO8d+oZYH0SPZMfkPh33C5GKc45Ey5VvNsZuUiWAAGxk+YXFLHzVqAd2/ecZi1VeQ==
X-Received: by 2002:a05:620a:142d:: with SMTP id k13mr20542471qkj.315.1604422814000;
        Tue, 03 Nov 2020 09:00:14 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id 68sm10586801qkg.108.2020.11.03.09.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 09:00:13 -0800 (PST)
Subject: Re: [PATCH v3 1/2] nbd: fix use-after-freed crash for nbd->recv_workq
To: xiubli@redhat.com, axboe@kernel.dk, ming.lei@redhat.com
Cc: nbd@other.debian.org, linux-block@vger.kernel.org, jdillama@redhat.com,
 mgolub@suse.de
References: <20201103065156.342756-1-xiubli@redhat.com>
 <20201103065156.342756-2-xiubli@redhat.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <f14ee0ba-df7c-4891-7fb9-00c003a0065a@toxicpanda.com>
Date: Tue, 3 Nov 2020 12:00:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201103065156.342756-2-xiubli@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <_vGwEvqbvuH.A.a8G.RDZofB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1036
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/f14ee0ba-df7c-4891-7fb9-00c003a0065a@toxicpanda.com
Resent-Date: Tue,  3 Nov 2020 17:18:09 +0000 (UTC)

On 11/3/20 1:51 AM, xiubli@redhat.com wrote:
> From: Xiubo Li <xiubli@redhat.com>
> 
> The crash call trace:
> 
> <6>[ 1012.319386] block nbd1: NBD_DISCONNECT
> <1>[ 1012.319437] BUG: kernel NULL pointer dereference, address: 0000000000000020
> <1>[ 1012.319439] #PF: supervisor write access in kernel mode
> <1>[ 1012.319441] #PF: error_code(0x0002) - not-present page
> <6>[ 1012.319442] PGD 0 P4D 0
> <4>[ 1012.319448] Oops: 0002 [#1] SMP NOPTI
> <4>[ 1012.319454] CPU: 9 PID: 25111 Comm: rbd-nbd Tainted: G            E     5.9.0+ #6
>     [...]
> <4>[ 1012.319505] PKRU: 55555554
> <4>[ 1012.319506] Call Trace:
> <4>[ 1012.319560]  flush_workqueue+0x81/0x440
> <4>[ 1012.319598]  nbd_disconnect_and_put+0x50/0x70 [nbd]
> <4>[ 1012.319607]  nbd_genl_disconnect+0xc7/0x170 [nbd]
> <4>[ 1012.319627]  genl_rcv_msg+0x1dd/0x2f9
> <4>[ 1012.319642]  ? genl_start+0x140/0x140
> <4>[ 1012.319644]  netlink_rcv_skb+0x49/0x110
> <4>[ 1012.319649]  genl_rcv+0x24/0x40
> <4>[ 1012.319651]  netlink_unicast+0x1a5/0x280
> <4>[ 1012.319653]  netlink_sendmsg+0x23d/0x470
> <4>[ 1012.319667]  sock_sendmsg+0x5b/0x60
> <4>[ 1012.319676]  ____sys_sendmsg+0x1ef/0x260
> <4>[ 1012.319679]  ? copy_msghdr_from_user+0x5c/0x90
> <4>[ 1012.319680]  ? ____sys_recvmsg+0xa5/0x180
> <4>[ 1012.319682]  ___sys_sendmsg+0x7c/0xc0
> <4>[ 1012.319683]  ? copy_msghdr_from_user+0x5c/0x90
> <4>[ 1012.319685]  ? ___sys_recvmsg+0x89/0xc0
> <4>[ 1012.319692]  ? __wake_up_common_lock+0x87/0xc0
> <4>[ 1012.319715]  ? __check_object_size+0x46/0x173
> <4>[ 1012.319727]  ? _copy_to_user+0x22/0x30
> <4>[ 1012.319729]  ? move_addr_to_user+0xc3/0x100
> <4>[ 1012.319731]  __sys_sendmsg+0x57/0xa0
> <4>[ 1012.319744]  do_syscall_64+0x33/0x40
> <4>[ 1012.319760]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> <4>[ 1012.319780] RIP: 0033:0x7f5baa8e3ad5
> 
> In case the reference of nbd->config has reached zero and the
> related resource has been released, if another process tries to
> send the DISCONENCT cmd by using the netlink, it will potentially
> crash like this.
> 
> Reviewed-by: Ming Lei <ming.lei@redhat.com>
> Signed-off-by: Xiubo Li <xiubli@redhat.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

