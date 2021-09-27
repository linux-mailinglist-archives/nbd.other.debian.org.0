Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [IPv6:2001:41b8:202:deb:216:36ff:fe40:4002])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B69541A340
	for <lists+nbd@lfdr.de>; Tue, 28 Sep 2021 00:45:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id 47D312042E; Mon, 27 Sep 2021 22:45:20 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Mon Sep 27 22:45:20 2021
Old-Return-Path: <axboe@kernel.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: ***
X-Spam-Status: No, score=3.8 required=4.0 tests=CC_TOO_MANY,DKIM_SIGNED,
	DKIM_VALID,MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	TO_TOO_MANY,TO_WAY_TOO_MANY autolearn=no autolearn_force=no
	version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 5D1AB20525
	for <lists-other-nbd@bendel.debian.org>; Mon, 27 Sep 2021 22:29:08 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=3.051 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, CC_TOO_MANY=3, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-1.969,
	RCVD_IN_DNSWL_NONE=-0.0001, TO_TOO_MANY=1, TO_WAY_TOO_MANY=3]
	autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id y71nv9x9utJ0 for <lists-other-nbd@bendel.debian.org>;
	Mon, 27 Sep 2021 22:29:03 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .kernel. - helo: .mail-il1-x129.google. - helo-domain: .google.)  FROM/MX_MATCHES_HELO(DOMAIN)=-2; rate: -5.5
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id B4FE120502
	for <nbd@other.debian.org>; Mon, 27 Sep 2021 22:29:03 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id q14so21079613ils.5
        for <nbd@other.debian.org>; Mon, 27 Sep 2021 15:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=w9ezsQ1UkQZeC53NkFhy7B+1aNQW9TNDf1kl1c4M4R4=;
        b=Ffjc9XDV39XVuLIm8DJDvOIHuyWwHa/JDveqkJIq4EPQcwwF6i2IwXvqTayH1Zs+J0
         zBBIHTdeujFBpyTsi7j+hLC6dG1lmzreXcsCJibD0ZHuJdAABtpVv3xmIelWiJg4Kiwx
         y74YiDFOoIziOuEp0bFDeka+WbUijbofv2enBSkOGJFIlEwWIxbA3L0TdOIDNHbvW4s3
         UX5WZ/WNqYbm3RB9OdDLcEyEdxxaBYh8+Ce09lqPv5Y/yeoNEYf2H8gl9ZQ2Gx73QUuz
         bK1mNwQj3yvOA8l/cfkBNHF9G4YJ0ALLNw+vW7N07eAC0HlFOVJ1jxEY1tUin9ivF4Jg
         GOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=w9ezsQ1UkQZeC53NkFhy7B+1aNQW9TNDf1kl1c4M4R4=;
        b=8Gbi4tKWyk0gIJC4NJxqzPp3pgfp+uysNEf51kodIH9eorb7/bbnOLsN8uCIUAMRvE
         Ylj0fc3hCjXg81aXzIsxcX4KR6O27FUaVZ7cAscXoegQTPFGNL+OsX8ClIjuKyb90qCM
         3qFZ5bCsOZpzuRjXkaoGf1TGGY/TI2A6JPjxHbvyv06IklemR0gTyJIxeRP1fOxE8ynz
         l+EMEbwb3pbHufYfj8Aojtplcl7FiscdSQ3P1ruz/kBQED3wYcpYw4UZWFzMKdGot5VK
         H8Z9BrVWjmUGr1Vbaj3hMO135AISMCTbCh0cprEXNpXY8Gz0kesgEsCTCO/Ppp+DWAjM
         AFBw==
X-Gm-Message-State: AOAM530Fck8jeeSvW1XTB9VFa8mUMIoZO8JdJdVJIaiAuMb/XJUS0nqp
	T/jh8FYd6IqOya72mhR9a0eICA==
X-Google-Smtp-Source: ABdhPJz2QpC01URNtiA6TI68tVS50xc5AHbinQF2wOnvWrWvzOWk+mcoidVwrUAWxR5vBmrTJemKng==
X-Received: by 2002:a05:6e02:661:: with SMTP id l1mr1855976ilt.122.1632781740297;
        Mon, 27 Sep 2021 15:29:00 -0700 (PDT)
Received: from [192.168.1.116] ([66.219.217.159])
        by smtp.gmail.com with ESMTPSA id z25sm7614559iow.20.2021.09.27.15.28.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Sep 2021 15:28:59 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] nbd: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>, martin.petersen@oracle.com,
 jejb@linux.ibm.com, kbusch@kernel.org, sagi@grimberg.me,
 adrian.hunter@intel.com, beanhuo@micron.com, ulf.hansson@linaro.org,
 avri.altman@wdc.com, swboyd@chromium.org, agk@redhat.com,
 snitzer@redhat.com, josef@toxicpanda.com
Cc: hch@infradead.org, hare@suse.de, bvanassche@acm.org, ming.lei@redhat.com,
 linux-scsi@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-mmc@vger.kernel.org, dm-devel@redhat.com, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
References: <20210927215958.1062466-1-mcgrof@kernel.org>
 <20210927215958.1062466-7-mcgrof@kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <dc945e14-498b-2cc1-8ef3-8dcaacfb948c@kernel.dk>
Date: Mon, 27 Sep 2021 16:28:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210927215958.1062466-7-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <aBcsHNIudHJ.A.7_H.AmkUhB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1531
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/dc945e14-498b-2cc1-8ef3-8dcaacfb948c@kernel.dk
Resent-Date: Mon, 27 Sep 2021 22:45:20 +0000 (UTC)

On 9/27/21 3:59 PM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.

Applied, thanks.

-- 
Jens Axboe

