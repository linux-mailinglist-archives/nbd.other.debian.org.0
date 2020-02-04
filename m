Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A82B15146E
	for <lists+nbd@lfdr.de>; Tue,  4 Feb 2020 04:00:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 242022049A; Tue,  4 Feb 2020 03:00:21 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Tue Feb  4 03:00:21 2020
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=4.0 tests=DIGITS_LETTERS,DKIM_SIGNED,
	DKIM_VALID,MD5_SHA1_SUM,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id BBCD4205B7
	for <lists-other-nbd@bendel.debian.org>; Tue,  4 Feb 2020 02:43:54 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DIGITS_LETTERS=1, DKIM_SIGNED=0.1,
	DKIM_VALID=-0.1, MD5_SHA1_SUM=-1, RCVD_IN_DNSWL_NONE=-0.0001]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id baLOW62zRplI for <lists-other-nbd@bendel.debian.org>;
	Tue,  4 Feb 2020 02:43:49 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-pl1-x643.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id DD8FA205C3
	for <nbd@other.debian.org>; Tue,  4 Feb 2020 02:43:49 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id g6so6639926plt.2
        for <nbd@other.debian.org>; Mon, 03 Feb 2020 18:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=bLnbFVejd+3O1F2qSJJv9BCdZUK0W2Xr7EIvWhOc4yI=;
        b=PGno+SbowrIU8CKbP76n7XJnkCyx2RPzHD8cjSZKYNNQ+5PDRUyfuygaDKnX0jdF4H
         fN3Ru1Vy6qSCGSAF8pTm4AiRKc/s/9cwJjWAQjBbM2DM62cg6VhLmF1o9nB74Ik+pYKI
         tkA82JcbrFs/daJ29fMcfAKpJF0+O2O3+WGZbRNE9aJQXLmeBW8mvLEbHWGvdgxAdS4P
         D7ShfiG3j4/aFD+DFBZUHDE1BlCU6sXN4e/u1PsjOuSqyPEFqwNz/anE3iSQPvu+ib08
         3kMVBaOQHm2hoa3raW+IVBY/PWtCtNikvghn+PhIBgyz+hYPmDN+yOnMYMqta6pa+HjB
         Mk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bLnbFVejd+3O1F2qSJJv9BCdZUK0W2Xr7EIvWhOc4yI=;
        b=oIsT8e7mTp9PRnYmgzB2he3lKyg3fjlGt7QiVWwjGIcnBA9cEJcLIDyQV2910wmeHi
         7kqh3feLvHFb3euIzTybqCieZTUQHyIYy/RgA8sRx7cJ2D3iwkX4sZ2YrWelPtDsFr2q
         BHlSn4+MsoysydQv9DcSFfIkxdr4X7P7sg7u4Sq7q/OBZZuHF/sLeWwB0pC5KvbIUTKf
         DQdxEgc9/R5yAyfRJ/4mkTfjTj/+/G2oIlxfqCn2/9tUKVRat6RLSlva5kIG/ATNmcYb
         sV8LEdvPGZMc2lIclf93sJzD2PlSglYwd1q76+qQY31Zt9V16+iFkBl8gHXhG343Llrm
         jgFg==
X-Gm-Message-State: APjAAAVGezjFo+SlfOh82ClwRhw4fPsBF2GKyuCqD8HEcDaFYcd3uXqS
	W/ycolYvJ/wwzsdUXfLnanzcKA==
X-Google-Smtp-Source: APXvYqzc6ciA9jRBi+H4LmQjqeOjXZrmG//h1JNiFsJW8mgEPZYLd9jRNeOJEU9ROi1FuxWxvdVw1Q==
X-Received: by 2002:a17:902:82c5:: with SMTP id u5mr26272336plz.219.1580784225969;
        Mon, 03 Feb 2020 18:43:45 -0800 (PST)
Received: from [172.20.10.2] ([107.72.98.248])
        by smtp.gmail.com with ESMTPSA id r66sm22716079pfc.74.2020.02.03.18.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2020 18:43:45 -0800 (PST)
Subject: Re: [v2] nbd: add a flush_workqueue in nbd_start_device
To: "sunke (E)" <sunke32@huawei.com>, josef@toxicpanda.com,
 mchristi@redhat.com
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <20200122031857.5859-1-sunke32@huawei.com>
 <aaa74a5a-3213-7b97-7cc4-89686d985ff2@huawei.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <03c783e2-dbb1-5807-90a4-1d51e965a0b2@kernel.dk>
Date: Mon, 3 Feb 2020 19:41:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <aaa74a5a-3213-7b97-7cc4-89686d985ff2@huawei.com>
Content-Type: text/plain; charset=gbk
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <9FQrqZcpndF.A.pkC.F5NOeB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/788
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/03c783e2-dbb1-5807-90a4-1d51e965a0b2@kernel.dk
Resent-Date: Tue,  4 Feb 2020 03:00:21 +0000 (UTC)

On 2/3/20 7:28 PM, sunke (E) wrote:
> ping

Maybe I forgot to reply, but I queued it up last week:

https://git.kernel.dk/cgit/linux-block/commit/?h=block-5.6&id=5c0dd228b5fc30a3b732c7ae2657e0161ec7ed80

-- 
Jens Axboe

