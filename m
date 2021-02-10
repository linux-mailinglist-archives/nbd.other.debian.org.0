Return-Path: <bounce-nbd=lists+nbd=lfdr.de@other.debian.org>
X-Original-To: lists+nbd@lfdr.de
Delivered-To: lists+nbd@lfdr.de
Received: from bendel.debian.org (bendel.debian.org [82.195.75.100])
	by mail.lfdr.de (Postfix) with ESMTPS id 07354316AC8
	for <lists+nbd@lfdr.de>; Wed, 10 Feb 2021 17:12:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with QMQP
	id DE97E20556; Wed, 10 Feb 2021 16:12:15 +0000 (UTC)
X-Mailbox-Line: From nbd-request@other.debian.org  Wed Feb 10 16:12:15 2021
Old-Return-Path: <josef@toxicpanda.com>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on bendel.debian.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=4.0 tests=DKIM_SIGNED,DKIM_VALID,
	MURPHY_DRUGS_REL8,NICE_REPLY_A,RCVD_IN_DNSWL_NONE autolearn=no
	autolearn_force=no version=3.4.2
X-Original-To: lists-other-nbd@bendel.debian.org
Delivered-To: lists-other-nbd@bendel.debian.org
Received: from localhost (localhost [127.0.0.1])
	by bendel.debian.org (Postfix) with ESMTP id 8F70620549
	for <lists-other-nbd@bendel.debian.org>; Wed, 10 Feb 2021 15:56:26 +0000 (UTC)
X-Virus-Scanned: at lists.debian.org with policy bank en-lt
X-Amavis-Spam-Status: No, score=-2.085 tagged_above=-10000 required=5.3
	tests=[BAYES_00=-2, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	MURPHY_DRUGS_REL8=0.02, NICE_REPLY_A=-0.105,
	RCVD_IN_DNSWL_NONE=-0.0001] autolearn=no autolearn_force=no
Received: from bendel.debian.org ([127.0.0.1])
	by localhost (lists.debian.org [127.0.0.1]) (amavisd-new, port 2525)
	with ESMTP id szdGhoq9AmPT for <lists-other-nbd@bendel.debian.org>;
	Wed, 10 Feb 2021 15:56:21 +0000 (UTC)
X-policyd-weight:  NOT_IN_SBL_XBL_SPAMHAUS=-1.5 CL_IP_EQ_HELO_IP=-2 (check from: .toxicpanda. - helo: .mail-qk1-x732.google. - helo-domain: .google.)  FROM/MX_MATCHES_NOT_HELO(DOMAIN)=0; rate: -3.5
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (not verified))
	by bendel.debian.org (Postfix) with ESMTPS id C30AC2054C
	for <nbd@other.debian.org>; Wed, 10 Feb 2021 15:56:21 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id m144so2065888qke.10
        for <nbd@other.debian.org>; Wed, 10 Feb 2021 07:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WJrPc40c+DHT1+Gb1xeUmwrG0pKHWNH3yQxd2xtCK8M=;
        b=cRjkdnxEuSk+fKCTpDoKWDNN+/sf80UvA1Z2MDKXGUHXz28rm2laXv43GuId/wawCx
         LVa9x17Qyy1g6/q6h8ocMmn8DGFB/NGdJt6uUZnAepydn/ZFNQQN3O9LMa56RbCAv+e+
         dKR8fedr+SNMchL0+cUIonB81msurXgwinDFI3916n/H0d6N2dto3Ua5/Pq3rX/l9+zm
         iyyST5Wmw5lHYfwJM8aqc6WxRTXHu1nEPE9yUnl5+dRhpgtylsilioX1e4W8rRx5S3xO
         C4MmD3V9D3F/ogJ+y1XJgBgVNJQj/sNWIxS1nFRzYM96W5bff1EG9Iqp2/QsnS5hvEeY
         Fq2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WJrPc40c+DHT1+Gb1xeUmwrG0pKHWNH3yQxd2xtCK8M=;
        b=G4DIcViUcwksHA+O0MqGQm2vxRXCqF9tCbeq+SuSCTSWx5kMfs8wL3Pq1p9D6lGNmt
         6szsGljpScGzPWiHmj4YEIXyfj7NBW9LUlk0tZMdoGwiMibStuXNvSJpzc/eg1N94FH+
         NqKpebxkdhojYLJShg/cffmA9vTWiZoKy/21MXGkujqRwQfING8nN9hYtnZsijOFqrXB
         DJOWBrwMEIprUUSa73EU14zL7XdaYkxxs8ZePzrmOB6WlEgTJs7UAgGwcZwd9y2kd0us
         dIRi8YGIRI2eHaaN4eYKNN+vgPIT4PzR88WZZ/pkavAyNB1+AXMR/JRN8PdydTaO1L9N
         J8sA==
X-Gm-Message-State: AOAM53017OHvkt70m5xV7sbWeXKI7vcc8e8/W2fKb2erIIMUwFfANYXU
	Gd1bWg8zxNFytMgTF/Pz6Jm2HA==
X-Google-Smtp-Source: ABdhPJwqLfnej9NV46Nv57GVPs/3uYC7wdpgJJUxUqsOCUK5RycE7UKiM5g5ymbyseJiosrxh6V6ug==
X-Received: by 2002:a37:6592:: with SMTP id z140mr3949912qkb.319.1612972578074;
        Wed, 10 Feb 2021 07:56:18 -0800 (PST)
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id t4sm1480081qto.62.2021.02.10.07.56.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Feb 2021 07:56:17 -0800 (PST)
Subject: Re: [PATCH] nbd: Convert to DEFINE_SHOW_ATTRIBUTE
To: winndows@163.com, axboe@kernel.dk
Cc: linux-block@vger.kernel.org, nbd@other.debian.org,
 linux-kernel@vger.kernel.org
References: <1612595455-4050-1-git-send-email-winndows@163.com>
From: Josef Bacik <josef@toxicpanda.com>
Message-ID: <3f6f04a5-b2e1-2f02-bb42-7466605e4dcb@toxicpanda.com>
Date: Wed, 10 Feb 2021 10:56:16 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612595455-4050-1-git-send-email-winndows@163.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Rc-Spam: 2008-11-04_01
X-Rc-Virus: 2007-09-13_01
X-Rc-Spam: 2008-11-04_01
Resent-Message-ID: <fY-2jIKCC5P.A.TaF.fXAJgB@bendel>
Resent-From: nbd@other.debian.org
X-Mailing-List: <nbd@other.debian.org> archive/latest/1128
X-Loop: nbd@other.debian.org
List-Id: <nbd.other.debian.org>
List-URL: <https://lists.debian.org/nbd/>
List-Post: <mailto:nbd@other.debian.org>
List-Help: <mailto:nbd-request@other.debian.org?subject=help>
List-Subscribe: <mailto:nbd-request@other.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:nbd-request@other.debian.org?subject=unsubscribe>
Precedence: list
Resent-Sender: nbd-request@other.debian.org
List-Archive: https://lists.debian.org/msgid-search/3f6f04a5-b2e1-2f02-bb42-7466605e4dcb@toxicpanda.com
Resent-Date: Wed, 10 Feb 2021 16:12:15 +0000 (UTC)

On 2/6/21 2:10 AM, winndows@163.com wrote:
> From: Liao Pingfang <winndows@163.com>
> 
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Liao Pingfang <winndows@163.com>

Reviewed-by: Josef Bacik <josef@toxicpanda.com>

Thanks,

Josef

