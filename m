Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 76097E553D
	for <lists+nbd@lfdr.de>; Fri, 25 Oct 2019 22:36:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 492CB205C4; Fri, 25 Oct 2019 20:36:08 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Fri Oct 25 20:36:08 2019
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VERIFIED,MURPHY_DRUGS_REL8,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8F267203AB
	for <lists-other-nbd@bendel.debian.org>; Fri, 25 Oct 2019 20:20:24 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-1.98 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id 0c90ly5ZekvY for <lists-other-nbd@bendel.debian.org>;
	Fri, 25 Oct 2019 20:20:20 +0000 (UTC)
X-policyd-weight: using cached result; rate: -5.5
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id 54356203D4
	for <nbd@other.debian.org>; Fri, 25 Oct 2019 20:20:20 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id 1so3850510iou.4
        for <nbd@other.debian.org>; Fri, 25 Oct 2019 13:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=xAAiYYk0xZv3OQ4bIpixpu+H5Kr/KOMzMnqKGzGYvyw=;
        b=q7QS/AL2Ywv77I0A1b8Whl+ujJhPJcrIEXK7HrU69l3R2PK6fB1/oFE0NpG70wM8ei
         h1EwGEAtsGwptZjF+wcQ4TPRbMZM7hKpDDnAnHUqmIqoe8v7neoE2JnXGLzq/BZjwLW5
         67mM33H01S6FHIg0NvFSulK60ZURLi5Fl+BLTMOBNxfOv4v89HdPmRb33AMK/5WE83xq
         5FyFPZcj2JBxUsOH2IeyOAtH2tcUGNlRMc4Nhpsk6tTSlY2yYq1GXz9NcjSOw2kAT9Nb
         51T/XOyY4gT3v+FQphk02V14xEcVzXM1M8O6eyPu78p/mYyc3wbiGXVrDxw8K8dJ4CH/
         0eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xAAiYYk0xZv3OQ4bIpixpu+H5Kr/KOMzMnqKGzGYvyw=;
        b=k2TZn/YMTb6APLWXpxwHwU5WZEQMwYbYw5A7U64W6mxgSlbqjQQSoDkvXS5gmj3V3R
         Cw5oW0pxLgCYo/vTpK52iYRJQEkxTx3WYky1va7l+W0dPGufFg1XaqfzYOx/oGA2Thxn
         9B/bBa/3CErCNzZXrJX2uY12P1ubmoIbAYbdHjQT1qms9wkasLNAPHa+mwbcQvDz1fR/
         tOC5HTTVk2IBGdIXlj7NO6SuNtZbRR+x66FpnotcS0AtHkXtz15TSPGeK/JP7MguEneD
         uDaXhyjRCGFcxNiFImNG5r8b83t+edCkiWePpU/idVyk4v0fBUPPXZQM3ltTdXjqQUcA
         hzyg==
X-Gm-Message-State: APjAAAXlqFNp5vuP6uXokBo0G0iP3pv1VtkZHCqQkjTBBEhAWsHz0xGq
	hiD/b8mrhwQYFUKdSn7muPW3vQ==
X-Google-Smtp-Source: APXvYqzJ6GnutgF6fFKINClKY+KF/w16vhPh2FXclM3XBKPJhjmK89dnzlJMd20Y63JjXJ/qFX9a/w==
X-Received: by 2002:a05:6602:2547:: with SMTP id j7mr5952332ioe.77.1572034817055;
        Fri, 25 Oct 2019 13:20:17 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
        by smtp.gmail.com with ESMTPSA id h24sm408169ioh.0.2019.10.25.13.20.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Oct 2019 13:20:16 -0700 (PDT)
Subject: Re: [PATCH 0/2] fix double completion of timed out commands
To: Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
 linux-block@vger.kernel.org, kernel-team@fb.com, mchristi@redhat.com
References: <20191021195628.19849-1-josef@toxicpanda.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <a6bb9e93-8572-4fb9-3ca1-f2442945d150@kernel.dk>
Date: Fri, 25 Oct 2019 14:20:15 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191021195628.19849-1-josef@toxicpanda.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <NbvzohmIfDH.A.fKB.4y1sdB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/722
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/a6bb9e93-8572-4fb9-3ca1-f2442945d150@kernel.dk
Resent-Date: Fri, 25 Oct 2019 20:36:08 +0000 (UTC)

On 10/21/19 1:56 PM, Josef Bacik wrote:
> We noticed a problem where NBD sometimes double completes the same request when
> things go wrong and we time out the request.  If the other side goes out to
> lunch but happens to reply just as we're timing out the requests we can end up
> with a double completion on the request.
> 
> We already keep track of the command status, we just need to make sure we
> protect all cases where we set cmd->status with the cmd->lock, which is patch
> #1.  Patch #2 is the fix for the problem, which catches the case where we race
> with the timeout handler and the reply handler.  Thanks,

Applied, thanks.

-- 
Jens Axboe

