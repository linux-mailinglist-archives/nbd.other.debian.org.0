Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9CA2731CE
	for <lists+nbd@lfdr.de>; Mon, 21 Sep 2020 20:21:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 0560720372; Mon, 21 Sep 2020 18:21:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 21 18:21:20 2020
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE
	autolearn=no autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id CCEF920372
	for <lists-other-nbd@bendel.debian.org>; Mon, 21 Sep 2020 18:04:27 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-3.11 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-2.13,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id m-7DXrZGdHfU for <lists-other-nbd@bendel.debian.org>;
	Mon, 21 Sep 2020 18:04:23 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qt1-x843.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id BAF2F20353
	for <nbd@other.debian.org>; Mon, 21 Sep 2020 18:04:23 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id g3so13185314qtq.10
        for <nbd@other.debian.org>; Mon, 21 Sep 2020 11:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pKTrFbirGmMhlMPaE3qlluEedF8FF8FARN5U5oI/yts=;
        b=da+XH/qwmtb8WAjxG5dCcuccvCfFtoSSeEEsClvefHSxKutsn/xkZ/hhCKIzjldp/4
         pOwY3fQE4hDbSOMu7+hCecdPCs5XT9RPQ7KqPIOcFQy2mS5IWyptRgjcXdll8wzZ6DtC
         dK57tYHqsRNMcCDY4mJqaCTuvLTXLbofUnONFu/d+SD2f3YV24R3J3Zl+Mc/4huwe+eb
         pBQExgLl3pQV3K2z0QVyvyazP8Y+341w4k5Z5+kPEFuOF1OMz0T2Awa6coQh0aSNmtnO
         h6TaCh64tGNnuiU68d5eTds39PqO4iMH/nVRFtcRws0IYhX4jn5u24otxqYwfjtmYV/f
         YIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pKTrFbirGmMhlMPaE3qlluEedF8FF8FARN5U5oI/yts=;
        b=O8skR2SgkBB0LDGVph5yTtjY4gFomQBu1M5DPvN4iwgfDGQ6mb6jCehGlfndnj28m/
         2u7A5hpZaLx3FsvA4gwscitZkcVK5jzdihHGQll3aOm1LH659nry6gYRb7oyUBveCujs
         Mx/mByHUXCCXuLUI/BBXgEP1akoFzvYMMKOoLNtTR4MGhMYgD7pgbzg6Ewt1izjtXXZh
         C7Bebce1nFjuEDhGop3qoIXwV8ihmMNWaP5Lfaq8bJoB18/aerYwwYN6q+JxcA+asJ73
         75fuF6oDntWw7o3BK6PDDedQtDc62d5Dba0J42v+vvjsU/asQHdIUWrpHR/GiveauS4f
         xc8A==
X-Gm-Message-State: AOAM532lIvC28DxoHMI/4mrlH+yWcWYh8ahpHZQM6E2ID5QD+cRj5vnD
	k7p+BsHsPW75wp7VMX53V75OS7s6Slu9RoxT
X-Google-Smtp-Source: ABdhPJx1v2LZEu/bjdlV8ckzvZHsmfXvcS3cjnqnGXVjyCPfrc1pjWK0iM9w+T5ROxx2kuw82jZiRw==
X-Received: by 2002:ac8:7744:: with SMTP id g4mr787970qtu.306.1600711460217;
        Mon, 21 Sep 2020 11:04:20 -0700 (PDT)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id v18sm10335803qtq.15.2020.09.21.11.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 11:04:19 -0700 (PDT)
Subject: Re: [PATCH 1/3] nbd: return -ETIMEDOUT when NBD_DO_IT ioctl returns
To: Hou Pu <houpu@bytedance.com>, axboe@kernel.dk
Cc: mchristi@redhat.com, linux-block@vger.kernel.org, nbd@other.debian.org
References: <20200921105718.29006-1-houpu@bytedance.com>
 <20200921105718.29006-2-houpu@bytedance.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <cf90de57-986e-8e96-0ea9-9a593cbd4c16@toxicpanda.com>
Date: Mon, 21 Sep 2020 14:04:18 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200921105718.29006-2-houpu@bytedance.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <GC8ECV8pJAF.A.lrG.g8OafB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/995
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/cf90de57-986e-8e96-0ea9-9a593cbd4c16@toxicpanda.com
Resent-Date: Mon, 21 Sep 2020 18:21:21 +0000 (UTC)

On 9/21/20 6:57 AM, Hou Pu wrote:
> We used to return -ETIMEDOUT if io timeout happened. But since
> commit d970958b2d24 ("nbd: enable replace socket if only one
> connection is configured"), user space would not get -ETIMEDOUT.
> This commit fixes this. Only return -ETIMEDOUT if only one socket
> is configured by ioctl and the user specified a non-zero timeout
> value.
> 
> Signed-off-by: Hou Pu <houpu@bytedance.com>

This is fine, you can add

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

to this one, thanks,

Josef

